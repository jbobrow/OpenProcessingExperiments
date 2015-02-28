
import java.awt.*;
import java.applet.*;
import javax.swing.*;
import java.io.*;


public class SumOfSquares extends JApplet  

{
    int i = 1;  //length of top row
    int step = 1; //step size
    int r = 25; //number of rows
    
    int n = i*r;      
    int j = i;  
    
    int d = 15;  //side length of boxes
       
    
    int R, G, B;

    String stringi;
    
        
    public void paint(Graphics g)
    {  
        while(n > i - 1)
        {

            int[][] A = new int[i][i];  //runs in the background, does all the computation
            
            stringi = Integer.toString(i);
            
            g.setColor(Color.black);
            g.drawString(stringi, d*i + d*2, d*(2 + i - j)); //labels columns with numbers
            
            R = (int)(Math.random( )*256);  //chooses random color
            G = (int)(Math.random( )*256);
            B = (int)(Math.random( )*256);
            
            g.setColor(new Color(R,G,B));
            g.drawString(stringi, 0, d*(2 + i - j));  //labels rows with numbers
            
       
                for (int row = 0;  row < i;  row++)  //assigns the row values to A
                {
                    for (int column = 0; column < 1; column++)
                    {
                        A[row][column] = row * row % i;
                        g.fillRect(d*(2 + A[row][0]), d*(1 + i - j), d - 1, d - 1);
                    }
                }
            
                for (int row = 0; row < 1; row++)  //assigns the column values to A
                {                
                    for (int column = 0;  column < i;  column++)
                    {
                        A[row][column] = column * column % i;
                    }
                }

                for (int row = 1;  row < i;  row++) //assigns other cell values to A
                {
                    for (int column = 1;  column < row + 1;  column++)
                    {
                        A[row][column] = (A[row][0] + A[0][column]) % i;
                        g.fillRect(d*(2 + A[row][column]), d*(1 + i - j), d - 1, d - 1);
                    }
                }


            i = i + step;
            j = j + step - 1;
             
        }
        
    }            
}



