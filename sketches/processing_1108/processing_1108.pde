
public class Matrix 
{
	private Integer r;
	private Integer c;
        private double[][] value;
        private double theMin = Integer.MAX_VALUE;
        private double theMax = Integer.MIN_VALUE;
  
        Matrix(Integer rows, Integer cols)
	{
            r = rows;
            c = cols;
            value = new double[r][c];
            for (int i = 0; i < this.r; i++)
            {
                for (int j = 0; j < this.c; j++)
                {
                    value[i][j] = -1.0;
                }
            }
        }

        public void update(int row, int col, double value)
        {
            if ((row <= this.r && row >= 0) && (col <= this.c && col >= 0 ))
            {
                if (value < theMin)
                    theMin = value;
                if (value > theMax)
                    theMax = value;
                    
                this.value[row][col] = value;
            }
        }
        public int getRows()
        {
           return r;
        }
        public int getCols()
        {
            return c;
        }
        public double getMin()
        {
            return theMin; 
        }
        public double getMax()
        {
            return theMax; 
        }
        
        public double getValue(int a, int b)
        {
            double ret = -1;
            if (a <= r && b <= c)
            {
                for (int i = 0; i < r; i++)
                {
                    if (i == a)
                    {
                        for (int j = 0; j < c; j++)
                        {
                            if (b == j)
                            {
                                 ret = value[i][j];
                            }
                        }
                    }
                }
            }
            return ret;
        }    
        public double[] getRow(int row)
        {
            double[] b = new double[this.c];
            for (int j = 0; j < this.c; j++)
            {
                b[j] = this.value[row][j];
            }
        
            return b;
        }

	public double[] getColumn(int col)
	{
                double[] a = new double[1];
                a[0] = 0.0;
                return a;
	}
        public Matrix transpose()
        {
           Matrix temp = new Matrix(this.r, this.c);
           double[] b = new double[this.c];
           for (int i = 0; i < this.c; i++)
           {
              b = this.getColumn(i);
            
              for (int j = 0; j < this.r; j++)
              {
                  temp.update(i, j, b[j]);
              }
           }
        
        return temp;
        }
        public void display()
        {
            for (int i = 0; i < this.r; i++)
            {
                for (int j = 0; j < this.c; j++)
                {
                    System.out.print("row "+i+", col "+j+" = "+value[i][j]+" ");
                }
                System.out.println();
            }
        }
}


