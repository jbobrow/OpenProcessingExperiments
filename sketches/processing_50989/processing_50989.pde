

 int xeyelid;
 int yeyelid;
 int ymove;
 int eyelidsup;
 int yeyemove;
 int xeyemove;
 float looksize;
 float d;
 float angle;
 float scaler;
 float lookvar;
 float var;
 
void setup()
{
 size (640,480);
 smooth(); 
 rectMode(CENTER);
 background(0);
 scaler = height/4;

}
void draw()
{
   background(0);
   fill(0,139,70);
   ellipse (10 + xeyemove,10 + yeyemove,75+d,100+d);
   ellipse (630 - xeyemove,10 + yeyemove,75+d,100+d);
   fill(188,53,38);
   ellipse (10 + xeyemove,20 +yeyemove,50+d,75+d);
   ellipse (630 - xeyemove,20 + yeyemove,50+d,75+d);
   fill(248,239,98);
   ellipse (10 + mouseX/looksize + xeyemove,30+mouseY/looksize-lookvar + yeyemove,20+var,20+var);
   ellipse (630 - mouseX/looksize - xeyemove,30+mouseY/looksize-lookvar +yeyemove,20+var,20+var);
   fill(1);
   ellipse (10,10 - ymove ,75 ,100 - xeyelid);
   ellipse (630,10 - ymove,75 ,100 - xeyelid);
   
  
  looksize = 50;
  
  if (eyelidsup > 9){ 
     xeyelid ++;
     if (xeyelid > 50){
    xeyelid = 50;}
      if (xeyelid == 50){
        ymove++;
  }
  if ((mouseX < 19)&&(mouseY >450)) {
    yeyemove ++;
    xeyemove ++;
    
  if (yeyemove > 200){
    yeyemove = 200;
  }
  if (xeyemove > 200){
    xeyemove = 200;
  }
  }
  
  if (xeyemove > 190)
    d = height/3 + (sin(angle) *scaler);
    angle = .005 ;
    var = sin(angle);
    angle = mouseX;
    }
  
}

  void mouseClicked() {
  eyelidsup = eyelidsup + 10; 
  }
    


