
void setup()
{
size(400,400); //canvas size
}
void draw()
{
background(100,60,890,440); //background color
  float a; //x
  float b; //y
  float c; //width
  float d; //height
  int width=40; //width value
  int height=40; //height value
    if (mousePressed) { //on mouseclick width and height doubles
  a = mouseX; 
  b = mouseY;
  c =  width*2;
  d = height*2;
  rect(a,b,c,d);
  fill(670,80,6,87);
    }
  if (mousePressed){ //on mouseclick width and height *4
  a = mouseX; 
  b = mouseY;
  c =  width*4;
  d = height*4;
  rect(a,b,c,d);
  fill(670,80,6,87);
    }
      if (mousePressed){ //on mouseclick width and height *6
  a = mouseX; 
  b = mouseY;
  c =  width*6;
  d = height*6;
  rect(a,b,c,d);
  fill(670,80,6,87);
    }
          if (mousePressed){ //on mouseclick width and height *8
  a = mouseX; 
  b = mouseY;
  c =  width*8;
  d = height*8;
  rect(a,b,c,d);
  fill(670,80,6,87);
    }
              if (mousePressed){ //on mouseclick width and height *10
  a = mouseX; 
  b = mouseY;
  c =  width*10;
  d = height*10;
  rect(a,b,c,d);
  fill(670,80,6,87);
    }
        else {
  a = mouseX;  //normal width and heights
  b = mouseY;
  c = width;
  d = height;
  rect(a,b,width,height);
  fill(670,80,6,87);
    }   
}
