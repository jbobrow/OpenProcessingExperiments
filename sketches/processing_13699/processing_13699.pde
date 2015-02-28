
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import processing.core.PApplet;
import processing.core.PImage;


public class midterm extends PApplet {
    private PImage equinox;
    private PImage noReturn;
    private Matrix myStyx;
    private Matrix myKansas;
    private Matrix myCurrent;
    private int[] myValues;
    private boolean posterize = false;
    private boolean invert=false;
	public void setup() {
	   
	    size(500,500);
	    smooth();
	    frameRate(30);
	    equinox=loadImage("styx_equinox.jpg");
	    noReturn = loadImage("kansas_point_of_know_return.jpg");
	    image(equinox,0,0);
	    myStyx = new Matrix(equinox);
	    myKansas = new Matrix(noReturn);
	    
	    myValues = new int[500];
	    for (int j=0; j<500; j++)
	        myValues[j]=1+j/100;
	    display(myCurrent=(myStyx));
	    
	}

	private void display(Matrix m) 
	{
      for (int i=0; i<m.rows(); i++)
          for (int j=0; j<m.columns(); j++)
              set(i,j,m.get(i, j));
        
    }

    public void draw() {
        
        if (mousePressed){
            if (mouseButton==LEFT)
          myCurrent = myCurrent.add(myKansas);
            else if (mouseButton == RIGHT)
            myCurrent = myCurrent.subtract(myKansas);
        display(myCurrent);
        }
        if (keyPressed){
            if (key == 'r')
                myCurrent=myCurrent.multiply(myCurrent.diagonal(myValues, 500));
            else if (key == 'a')
                myCurrent=myCurrent.swapRows(mouseX, mouseY, 500);
            else if (key== 'l')
                myCurrent = myCurrent.diagonal(myValues, 500).multiply(myCurrent);
            else if (key == ';')
                myCurrent=myCurrent.swapColumns(mouseX, mouseY, 500);
            else if (key == 't')
                myCurrent = myCurrent.transpose();
            else if (key == 'z'){
                myCurrent = new Matrix(equinox);
                posterize=false;
            }
            else if (key == 'p')
                posterize=true;
            else if (key == 'i')
              invert=true;
         
            display(myCurrent);
        }
        if(invert){
            filter(INVERT);
            invert=false;
        }
            
        if (posterize)
            filter(POSTERIZE, 5);
        
    }
	


    public class Matrix {
        private int[][] myMatrix;
        public Matrix(PImage image)
        {
           myMatrix = new int[image.height][image.width];
           for (int i=0; i<image.height; i++)
               for (int j=0; j<image.width; j++)
                   myMatrix[i][j]=image.get(i, j);
            
        }
        
        private Matrix (int rows, int columns)
        {
            myMatrix = new int[rows][columns];
        }
        public int rows()
        {
            return myMatrix.length;
        }
        public int columns()
        {
            return myMatrix[0].length;
        }
        public void set(int value, int x, int y)
        {
            myMatrix[x][y]=value;
        }
        public Matrix diagonal(int[] values, int size)
        {
            Matrix diagonal = new Matrix(size,size);
            for (int i=0; i<diagonal.columns(); i++)
                diagonal.set(values[i], i, i);
            return diagonal;
        }
        public Matrix identity(int size)
        {
            int [] ones = new int[size];
            for (int k=0; k<ones.length; k++)
                ones[k]=1;
            return diagonal(ones, size);
        }
        public int get(int x, int y)
        {
            return myMatrix[x][y];
        }
        
        public Matrix transpose()
        {
            int[][] newMatrix = new int[myMatrix[0].length][myMatrix.length];
            for (int i=0; i<myMatrix[0].length; i++)
                for (int j=0; j<myMatrix.length; j++)
                    newMatrix[i][j]=myMatrix[j][i];
            myMatrix=newMatrix;
            return this;
        }
        
        public Matrix add(Matrix o)
        {
            if (this.columns()!= o.columns() || this.rows()!= o.rows())
                throw new RuntimeException("These matrices are not the same size and can't be added");
            for (int i=0; i<this.rows(); i++)
                for (int j=0; j<this.columns(); j++)
                    myMatrix[i][j] += o.get(i, j);
            return this;
        }
        public Matrix subtract(Matrix o)
        {
            if (this.columns()!= o.columns() || this.rows()!= o.rows())
                throw new RuntimeException("These matrices are not the same size and can't be subtracted");
            for (int i=0; i<this.rows(); i++)
                for (int j=0; j<this.columns(); j++)
                    myMatrix[i][j] -= o.get(i, j);
            return this;   
        }
        public Matrix swapRows(int i, int j, int size)
        {
            Matrix swap = new Matrix(size, size).identity(size);
            swap.set(0, i, i);
            swap.set(1, j, i);
            swap.set(1, i, j);
            swap.set(0,j,j);
            return swap.multiply(this);
        }
        public Matrix multiply(Matrix o)
        {
            int[][] newMatrix = new int[this.rows()][o.columns()];
            if (this.columns() != o.rows())
                throw new RuntimeException("These matrices cannot be multiplied"+this.columns() + " "+o.rows());
            for (int i=0; i<this.rows(); i++)
                for (int j=0; j<o.columns(); j++){
                    int sum = 0;
                    for (int k=0; k<this.rows(); k++)
                        sum+= this.get(i, k)*o.get(k, j);
                    newMatrix[i][j]=sum;
                }
            myMatrix = newMatrix;
            return this;
        }
        
       

        public Matrix swapColumns(int mouseX, int mouseY, int size) 
        {
            return this.transpose().swapRows(mouseX, mouseY, size).transpose();
        }

    }

	
	
	public class Pair{
	    private int myX;
	    private int myY;
	    public Pair(int x, int y)
	    {
	        myX=x;
	        myY=y;
	    }
	    public boolean equals(Object o)
	    {
	       Pair pair= (Pair)o;
	       return myX == pair.myX && myY== pair.myY;
	    }
	}
	
	    
	
}


