
size(600,600);
smooth();
background(#AEF5A1);
stroke(10);

float x,y;
int iNumPiezas=10;

 for (int i=0; i<10; i=i+1)
  {
     for (int j=0; j<10; j=j+1)
        
        {
          x= map (i,0,iNumPiezas -4,0,width);
          y= map (j,0,iNumPiezas -2.5,0,height);
          
              translate (x,y);
              for (int g=0; g<2; g=g+1)
             {
             fill(0);
             arc (0,-20,40,40,radians(180),radians(280));
             beginShape ();
                  vertex(0,-20);
                  vertex (0,0);
                  vertex (-30,0);
                  vertex (-30,-20);
                  vertex (0,-20);
              endShape();
              
              beginShape ();
                  vertex(-30,0);
                  vertex (-49,0);
                  vertex (-49,-15);
                  vertex (-30,-15);
                  vertex (-30,0);
              endShape();
              
              fill(#AEF5A1);
                  arc (-50,-20,40,40,radians(0),radians(90));
                  line(-30,-20,-20,-20);
             
             rotate (radians(180));
             }
             
             
             for (int k=0; k<2; k=k+1)
              {
               fill(0);
               arc (0,-20,40,40,radians(270),radians(370));
               beginShape ();
                    vertex(0,-20);
                    vertex (0,0);
                    vertex (30,0);
                    vertex (30,-20);
                    vertex (0,-20);
                endShape();
                
                beginShape ();
                    vertex(30,0);
                    vertex (49,0);
                    vertex (49,-15);
                    vertex (30,-15);
                    vertex (30,0);
                endShape();
                
                fill(#AEF5A1);
                    arc (50,-20,40,40,radians(90),radians(180));
                    line(20,-20,30,-20);
                
             rotate(radians(180));
                 
              }
              translate (-x,-y);
          }
    }


