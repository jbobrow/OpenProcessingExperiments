
float x2,y2,oldx,oldy;
int n =30000;
float[] x=new float[n];
float[] y=new float[n];
int w=450,h=700;
int d=10;
PImage img;
color pix;
void setup() {
 // img = loadImage("6.jpg");
 // img.loadPixels();
//  loadPixels();
  ellipseMode(CENTER);
  rectMode(CENTER);
  background(0);
//  size(img.width, img.height);  
size(50,50);
  stroke(255); 
 // sup();
 // saveFrame("f.png");
}
/*void sup() {
  //image(img,0,0);
  noFill();
  strokeWeight(2);  
  strokeWeight(1);
  for (int i = 0; i < n; i++){
    //x[i] = random(0, w);
   // y[i] = random(0, h);
   x[i] = random(img.width);
   y[i] = random(img.height);
   //color pix = img.get(x[i], y[i]);
  }  
  
  for (int i = 0; i < n; i++){               
    for(int ii = i+1; ii < n-1;ii++){
      pix = img.get(int(x[i]),int(y[i]));
      if (dist(x[ii],y[ii],x[i],y[i]) < d){                       
          strokeWeight(0.3);
          stroke(pix);
          line(x[i],y[i],x[ii],y[ii]);          
      }
          //noStroke();
          //stroke(pix,50);
            
           fill(pix,100);
          //triangle(x[i],y[i],x[i]+5,y[i]+10,x[i]+10,y[i]); 
          //rect(x[i],y[i],2,2);      
    }
    strokeWeight(2);              
    point(x[i],y[i]);
  }  
}
