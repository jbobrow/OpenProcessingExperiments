
void setup(){
  size(800,800);
  background(0);
  frameRate(1000);
  colorMode(RGB, 255,255,255,100);
}

public float xaxis = 250;
public float yaxis = 250;
public int r = int(random(0,255));
public int g = int(random(0,255));
public int b = int(random(0,255));
//Size of Circle
public int ellipsesize = int(random(2,5));
//Determine if Bigger or Smaller than this number
public int constanti = int(random(49.5,50));

public int xaction = 0;
public int yaction = 0; 

public int raction = 0;
public int gaction = 0; 
public int baction = 0;

public int xcount = 0;
public int xcount2 = 0;
public int ycount = 0;
public int ycount2 = 0;



void draw(){
  
  //Why dosen't this support a transparent bg?
 // fill(255,255,255,1);
  //rect(-10,-10,width + 20,height + 20);
  
  xaction = int(random(0,100));
  yaction = int(random(0,100));
  raction = int(random(0,100));
  gaction = int(random(0,100));
  baction = int(random(0,100));

  
  //Increase or Decrase X axis
  if(xaxis > 0 && xaxis < width){
    if(xaction > constanti){
      xaxis = xaxis - 1;
      xcount++;
    }
    else{
      xaxis = xaxis + 1;
      xcount2++;
    }
  }
  else{
   if(xaxis == 0){
    xaxis = xaxis + 1; 
   } 
   if(xaxis == width){
     xaxis = xaxis - 1; 
   }
  }
  //Increase or decrase Y axis
  if(yaxis > 0 && yaxis < height){
      if(yaction > constanti){
        yaxis = yaxis - 1;
         ycount++;
      }
      else{
        yaxis = yaxis + 1;
         ycount2++;
      }
  }
    else{
   if(yaxis == 0){
    yaxis = yaxis + 1; 
   
   } 
   if(yaxis == height){
     yaxis = yaxis - 1; 

   }
  }
   //Increase or Decrase R 
  if(raction > constanti){
    r = r - 1;
  }
  else{
    r = r + 1;
  }
  //Increase or decrase G
  if(gaction > constanti){
    g = g - 1;
  }
  else{
    g = g + 1;
  }
   //Increase or Decrase B
  if(baction > constanti){
    b = b - 1;
  }
  else{
    b = b + 1;
  }

  
  fill(r,g,b);
  noStroke();
  ellipse(xaxis, yaxis,ellipsesize,ellipsesize);
   
  float xcount1 = xcount;
  float countx1 =  round(((xcount) / (xcount1 + xcount2)) * 100);
  float countx2 =  round(((xcount2) / (xcount1 + xcount2)) * 100);
  
  float ycount1 = ycount;
  float county1 =  round(((ycount) / (ycount1 + ycount2)) * 100);
  float county2 =  round(((ycount2) / (ycount1 + ycount2)) * 100);
  
  
   
  println("XAXIS: " + countx1 + " / " + countx2 + " YAXIS " +  county1 + " / " + county2);
}

void mousePressed(){
 noLoop(); 
}

