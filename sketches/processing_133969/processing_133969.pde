
float th =3;

float mouseXspd=abs(mouseX-pmouseX);
float mouseYspd=abs(mouseY-pmouseY);
float mouseSpd=sqrt(sq(mouseXspd)+sq(mouseYspd));

float la = 100;
float li = 500-20;
float lj = 500-60;
float lk = 500-100;
float lx =150;
float ly =50;
float lz =2;

char B=66;
char G=71;
char R=82;
void setup(){
  size(500,500);
  background(200);
}
void draw(){
  strokeWeight(th);
  
  mouseXspd=abs(mouseX-pmouseX);
  mouseYspd=abs(mouseY-pmouseY);
  mouseSpd=sqrt(sq(mouseXspd)+sq(mouseYspd));
  
  stroke(lx,ly,lz);
  if (mousePressed){
    //the drawing line
    line(pmouseX,pmouseY,mouseX,mouseY);
    if ((la<=mouseX) && (mouseX<=la+300)){
      if (mouseY>=500-40){
        lx = mouseX-la;
      }else if (mouseY>=500-80){
        ly = mouseX-la;
      }else if (mouseY>=500-120){
        lz = mouseX-la;
      }
    }
  }
  strokeWeight(3);
  fill(255);
  stroke(255,0,0);
  rect(10,10,30,20);
  stroke(0,255,0);
  rect(205,10,30,20);
  stroke(0,0,255);
  rect(370,10,30,20);
  
  stroke(255,255,0);
  rect(100,30,30,20);
  stroke(0,255,255);
  rect(285,30,30,20);
  stroke(255,0,255);
  rect(460,30,30,20);
  
  stroke((lx+ly+lz)/3);
  rect(210,60,30,20);
  
  fill(0);
  text(lx,15,25);
  text(ly,210,25);
  text(lz,375,25);
  
  text((lx+ly)/4,105,45);
  text((ly+lz)/4,290,45);
  text((lz+lx)/4,465,45);
  
  text((lx+ly+lz)/3,215,75);
  //bars of colors
  stroke(20);
  fill(lx,ly,lz);
  rect(85,500-120,330,115);
  
  textSize(14);
  //red
  fill(175,0,0);
  text("R",la-30,li);
  line(la,li,la+300,li);
  ellipse(lx+la,li,15,25);
  //green
  fill(0,175,0);
  text("G",la-30,lj);
  line(la,lj,la+300,lj);
  ellipse(ly+la,lj,15,25);
  //blue
  fill(0,0,175);
  text("B",la-30,lk);
  line(la,lk,la+300,lk);
  ellipse(lz+la,lk,15,25);
  
    if (key=='i'){
    th=abs(250/( mouseSpd+15));
  }
}
void keyPressed(){
   if (key=='1'){
    th=1;
  }else if (key=='2'){
    th=2;
  }else if (key=='3'){
    th=3;
  }else if (key=='4'){
    th=4;
  }else if (key=='5'){
    th=5;
  }else if (key=='6'){
    th=6;
  }
  if (key==' '){
    background(200);
  }
}


