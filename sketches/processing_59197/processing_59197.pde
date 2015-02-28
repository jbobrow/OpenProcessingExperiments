

 float  Sx=0.0;
 float Sy=0.0;
PVector q;
int w = 255;
int h = 255;
boolean down = false;
boolean icheck = true;
void setup(){
  size(255,255,P2D);  
  Sx =random(255);
  Sy= random(255);

}

void draw(){
  fill(255);
  rect(0,0,w,h ); 
  ellipse(Sx,Sy,10,10);
  if(down){
    //  line(Sx,Sy,mouseX,mouseY); 
    line(Sx,0,Sx,h);
    line(0,Sy,w,Sy);
    // }
    // q = mx(abs(mouseX-Sx),abs(mouseY-Sy),Sx,Sy);
    q = mx(mouseX,mouseY,Sx,Sy);
    int  aa  = int(q.z);
    float bb=0;
    float cc = 0;

    for (int i = 0;i<aa;i+=1){
      bb+=q.x;
      cc+=q.y;
      //  line(Sx-bb,Sy-cc,mouseX,Sy-cc); 
      // line(Sx+bb,Sy-cc,mouseX,mouseY-cc);  //cool
      //line(bb,Sy-cc,mouseX-bb,Sy-cc);
      // line(Sx-bb,Sy+cc,mouseX,Sy+cc);
      float lx1 = Sx+bb;
      // if(lx1<mouseX)   {

      //      point(lx1,Sy); 
    //  ellipse(lx1,Sy,6,6);
      //      
      //     point(lx1,Sy-cc);  // line with just dots
      noStroke();
      fill(1,255-bb);
     ellipse(lx1,Sy-cc,2,2);
     
         ellipse(Sx-bb,Sy-cc,2,2);
      ellipse(Sx-bb,Sy+cc,2,2);
     ellipse(Sx+bb,Sy+cc,2,2);
      stroke(1,255-bb);
if(i%2==0){
   
  stroke(1,255-bb);
  
}
      line(lx1,Sy,lx1,Sy-cc);
      line(Sx-bb,Sy,Sx-bb,Sy-cc); //opposite
            line(Sx-bb,Sy+cc,Sx-bb,Sy); //opposite2
         line(Sx+bb,Sy,Sx+bb,Sy+cc); //opposite3
    //  line(Sx-bb,Sy-cc,Sx-bb,Sy-cc);
     //  fill(1,255-bb);
     //    noStroke();
   
      // }

    }
  }
}


void mousePressed(){
  if(icheck){
    Sx = mouseX;
    Sy = mouseY; 
    down= true;
  }

  icheck = false; 
}


void mouseReleased(){

  down = false; 
  icheck = true;
  // Sx=mouseX;
  // Sy=mouseY;
}

float xby=0.00;

PVector mx(float Ax,float Bx,float C,float D){

  float A = abs(Ax-C);
  float B = abs(Bx-D);
  float retval2;
  retval2 = max(A,B);

  PVector retval = new PVector(A/retval2,B/retval2,retval2);

  return retval;

}

