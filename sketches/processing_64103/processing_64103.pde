

int value =50;
int x= 250;
int d =265; 

void setup(){
  smooth();

size(500,500);
background(0);

}

void draw(){
  smooth();
strokeWeight(20);
stroke(255);
smooth();
line(x,0,x,265);
strokeWeight(12);
line(x,270, value,265);

  smooth();
ellipse(100,100,value,value);
  smooth();

ellipse(400, 100,value,value);
  smooth();
fill(0);
smooth();
ellipse(100,100,40,40);
ellipse(400, 100,value,value);

ellipse( 250, 370, value,value);

line(80,130,120,130);

line(370,130,120,130);
smooth();
noFill();
beginShape();
vertex(15, 30);
bezierVertex(20, -5, 70, 5, 40, 35);
bezierVertex(5, 70, 45, 105, 70, 70);
endShape();

line( 250,300, 130,300);
}

/*/ 
void mousePressed(){
  
  if (value== 50){
    value=110;}
    else{value=50;}
}

/*/
void mouseMoved(){
 value = value +5;
 
   if(value>120)
   value=0;
   
   {
     
 }
}





