
/*Rachel Moeller
*/
/*import processing.pdf.*;

void setup() {
  size(400, 400, PDF, "RachelEMS2WallPaper.pdf");
}

void draw()
{*/
int tan=0;
int negtan=0;
size(600,600);
background(255,255,255);

for(int i=0;i<=width;i=i+20)
{
  for(int j=0;j<=height;j=j+30)
  {
    tan=i+5;
    negtan=i-5;
   //Circles
  //draw main circles
    strokeWeight(.7);
    fill(0);
    ellipse(i,j, 10,10);
   fill(255);
    
    
    //draw the two inner circles
    //upstroke circle
    ellipse(tan-2,j,4,4);
    //downstroke circle
    ellipse(i-3,j,4,4);
    
    //draw the awaiting circle
    //up circle
    ellipse(i+7,j-9,3,3);
    //down circle
    ellipse(i-7,j+9,3,3);
    
    //draw floating circles
    fill(0);
    ellipse(tan+5,j,2,2);
    ellipse(tan+5,j-5,2,2);
    ellipse(tan+4,j+5,2,2);//
    ellipse(tan, j+9,2,2);
    ellipse(tan-5,j+11,2,2);
    noFill();

    
  //draw up stroke
    strokeWeight(1);
    line(tan,j,tan,(j-15));
    //draw down stroke
    line(negtan,j,negtan,(j+15));
    
    //begin drawing tails
    strokeWeight(.8);
    //up arcs x3
    //top arc
    arc(tan+2.5,j-15,5,5,PI,TWO_PI);
    //middle arc
    arc(tan+2.5,j-13,3,3,PI,TWO_PI);
    //bottom arc
    arc(tan+2.5,j-11,2,2,PI,TWO_PI);
    //line(tan,j-14, i+10,j-14);
    
    //down arcs x3
    //bottom arc(widest)
    arc(negtan-2.5,j+15,5,5,0,PI);
    //middle arc
    arc(negtan-2.5,j+13,3,3,0,PI);
    //top arc
    arc(negtan-2.0,j+11,2,2,0,PI);
  }
}
/*println("Finished.");
exit();
  
}  */




