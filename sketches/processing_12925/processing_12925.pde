
float x;
float y;
float xn;
float yn;
float xc;
float yc;
float sizex;
float sizey;

void setup(){
//window size
size(600,600);
//background colour (white)
background(255);
//anti-aliasing
smooth();
sizex = random(width/2);
sizey = random(height);
 
}
void draw(){
  //manual drawing only occurs on right hand side
  if (mouseX>=(0.5*width)){
    line(mouseX,mouseY,mouseX,mouseY);
    //dynamic colour
    stroke(0,mouseX/2,mouseY/3);
    //line thickness
    strokeWeight(10);
  }
  
  else {
    //line thickness
    strokeWeight(2);
    
    //define float values
    xn=x+xc;
    yn=y+yc;
   
    //line movement
    if(xn<0){xn=abs(xn);}
    if(yn<0){yn=abs(yn);}
    
    //makes the lines only draw on left hand side of drawing
    if(xn>(width/2)){xn=(width/2)-abs((width/2)-xn);}
    if(yn>height){yn=height-abs(height-yn);}
   
    line(x,y,xn,yn);
    x=xn;
    y=yn;
    //spot location
    xc = random(-100,100);
    yc = random(-100,100);
    
    //red spot
    if (dist(x+xc,y+yc,sizex,sizey)<100) {stroke(255,0,0);  }
    //orange spot
    if (dist(x+xc,y+yc,sizex,sizey)<200){if (dist(x+xc,y+yc,sizex,sizey)>100){stroke(255,100,0);}}
    //yellow spot
    if (dist(x+xc,y+yc,sizex,sizey)<300){if (dist(x+xc,y+yc,sizex,sizey)>200){stroke(255,255,0);}}
    //black
    else {{stroke(0);  }}
  }
}

