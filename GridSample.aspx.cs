using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;

    public partial class GridSample : System.Web.UI.Page
    {
        private IList<Student> _students;
        private Student _student;
        private DataSet ds;
        private DataTable dataTable;
        Image sortImage = new Image();
        public string SortDireaction
        {
            get
            {
                if (ViewState["SortDireaction"] == null)
                    return string.Empty;
                else
                    return ViewState["SortDireaction"].ToString();
            }
            set
            {
                ViewState["SortDireaction"] = value;
            }
        }
        private string _sortDirection;


        public GridSample()
        {
            //Create Student List 
            _students = new List<Student>();
            _student = new Student();
            _student.RollNumber = 11;
            _student.Class = "5Th";
            _student.Div = "A";
            _student.Name = "Raju";
            _students.Add(_student);
            _student = new Student();
            _student.RollNumber = 13;
            _student.Class = "6Th";
            _student.Div = "A1";
            _student.Name = "Chanki";
            _students.Add(_student);
            _student = new Student();
            _student.RollNumber = 21;
            _student.Class = "5Th";
            _student.Div = "A3";
            _student.Name = "Amit";
            _students.Add(_student);
            _student = new Student();
            _student.RollNumber = 61;
            _student.Class = "9Th";
            _student.Div = "A4";
            _student.Name = "Suresh";
            _students.Add(_student);

            dataTable = new DataTable("Student");
            //Add column
            // Add columns.
            for (int i = 0; i < 4; i++)
            {
                dataTable.Columns.Add();
            }
            // Add rows.
            foreach (var item in _students)
            {
                string[] obj = new string[4];
                obj[0] = item.Name;
                obj[1] = item.Class;
                obj[2] = item.Div;
                obj[3] = item.RollNumber.ToString();
                dataTable.Rows.Add(obj);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void BindGrid()
        {
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            SetSortDirection(SortDireaction);
            if (dataTable != null)
            {
                //Sort the data.
                dataTable.DefaultView.Sort = e.SortExpression + " " + _sortDirection;
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                SortDireaction = _sortDirection;
                int columnIndex = 0;
                foreach (DataControlFieldHeaderCell headerCell in GridView1.HeaderRow.Cells)
                {
                    if (headerCell.ContainingField.SortExpression == e.SortExpression)
                    {
                        columnIndex = GridView1.HeaderRow.Cells.GetCellIndex(headerCell);
                    }
                }

                GridView1.HeaderRow.Cells[columnIndex].Controls.Add(sortImage);
            }
        }

        protected void SetSortDirection(string sortDirection)
        {
            if (sortDirection == "ASC")
            {
                _sortDirection = "DESC";
                sortImage.ImageUrl = "view_sort_ascending.png";

            }
            else
            {
                _sortDirection = "ASC";
                sortImage.ImageUrl = "view_sort_descending.png";
            }
        }
    }

    public class Student
    {
        public int RollNumber { get; set; }
        public string Name { get; set; }
        public string Class { get; set; }
        public string Div { get; set; }
    }

