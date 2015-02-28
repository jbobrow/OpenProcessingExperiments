
//******************************//
//    Phyllotactic Pattern      //
//                              //
//      Dynamic Rotorelief      //
//                              //
//      By Sandip Chauhan       //
//******************************//


PGraphics spiral;
float i,j=0;
float c;
float a=0;
float theta,px,py;
void setup()
{
  size (900,900);
  background(0);
  spiral = createGraphics(900, 900, P3D);
}


void draw()
{
 spiral.beginDraw();
 spiral.noStroke();
 //strokeWeight(2);
 
 spiral.smooth();
if(i<=400){
  j=j+1;
  //delay(300);
  c=map(i,0,400,0,255);
  spiral.fill(0,2);
 
// rect(0,0,width, height);
  spiral.translate(width/2, (height/2));
  spiral.rotate(-(2*(PI))+radians(i));
  //fill(0,c,255-c);
  //fill(0);
  if(j%2==0)
  {
    spiral.fill(255-c,0,255);
  }
  else
  {
    spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
  spiral.rotate(-(2*(PI)+radians(i)));
  spiral.rotate(2*(PI/8)+radians(i));
  if(j%2==0)
  {
    spiral.fill(0,255-c,255);
  }
  else
  {
   spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
  spiral.rotate(-(2*(PI)+radians(i)));
  spiral.rotate(2*(PI/8)+radians(i));
  if(j%2==0)
  {
    spiral.fill(255,255-c,0);
  }
  else
  {
 spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
  spiral.rotate(-(2*(PI)+radians(i)));
  spiral.rotate(2*(PI/8)+radians(i));
  if(j%2==0)
  {
    spiral.fill(0+c,0,255);
  }
  else
  {
    spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
  spiral.rotate(-(2*(PI)+radians(i)));
  spiral.rotate(2*(PI/8)+radians(i));
  if(j%2==0)
  {
    spiral.fill(0,255,0+c);
  }
  else
  {
    spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
  spiral.rotate(-(2*(PI)+radians(i)));
  spiral.rotate(2*(PI/8)+radians(i));
  if(j%2==0)
  {
    spiral.fill(255,0+c,0);
  }
  else
  {
   spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
  spiral.rotate(-(2*(PI)+radians(i)));
  spiral.rotate(2*(PI/8)+radians(i));
  if(j%2==0)
  {
    spiral.fill(c,100,255);
  }
  else
  {
   spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
  spiral.rotate(-(2*(PI)+radians(i)));
  spiral.rotate(2*(PI/8)+radians(i));
  if(j%2==0)
  {
    spiral.fill(100,c,255);
  }
  else
  {
   spiral.fill(100+c);
  }
  spiral.ellipse(10,i,20,20);
//background(255,255,255);
  
  //}
 //if(j<=540){
// fill(0,1);
 // rect(0,0,width, height);
 // translate(width/2, height/2);
/* rotate(2*(PI) +radians(i));
  fill(0,255-c,c);
   rotate(-(2*(PI) +radians(i)));
    fill(0,255-c,c);*/
  //rect(i/100,i/100,i/10,1);
 // fill(255-c,c,255-c);
//  rect(0,i/2,4,50-i);
//background(255,255,255);
  i=i+10;
  //j=j+2;
  }
spiral.endDraw();

fill(0,90);
rect(0,0,900,900);
translate(width/2,height/2);

imageMode(CENTER);
rotate(radians(-a));
image(spiral,0,0);

//a+=80;
speed();


//px=(707.1067)*cos(radians(theta));
//py=(707.1067)*sin(radians(theta));
//translate(width/2,height/2);
//translate(px,py);
//image(spiral,0,0);
//theta+=1;


println(i);
println(j);

}
void speed() {
  if(keyPressed) {
    if (key == '1') 
    {
      a+=10;  
    }
    if (key == '2') 
    {
      a+=20;  
    }
     if (key == '3') 
    {
      a+=30;  
    }
    if (key == '4') 
    {
      a+=40;  
    }
    if (key == '5') 
    {
      a+=50;  
    }
     if (key == '6') 
    {
      a+=60;  
    }
    if (key == '7') 
    {
      a+=70;  
    }
    if (key == '8') 
    {
      a+=80;  
    }
     if (key == '9') 
    {
      a+=90;  
    }
     if (key == '0') 
    {
      a+=2;  
    }
    
    
  } else {
     a+=1;  
    
  }
  //a+=1;
  //rect(25, 25, 50, 50);
}

