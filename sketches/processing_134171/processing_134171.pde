
float th =6;
int h = 700;
int w = 1000;

float mouseXspd=abs(mouseX-pmouseX);
float mouseYspd=abs(mouseY-pmouseY);
float mouseSpd=sqrt(sq(mouseXspd)+sq(mouseYspd));

float la = w/2-150;//100;
float li = h-20;
float lj = h-60;
float lk = h-100;
float lx =150;
float ly =50;
float lz =2;

//char B=66;
//char G=71;
//char R=82;
void setup(){
  size(w,h);
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
      if (mouseY>=h-40){
        lx = mouseX-la;
      }else if (mouseY>=h-80){
        ly = mouseX-la;
      }else if (mouseY>=h-120){
        lz = mouseX-la;
      }
    }
  }
  //the first stroke calculation
  strokeWeight(3);
  fill(255);
  stroke(255,0,0);
  rect(10*w/500,10,30,20);
  stroke(0,255,0);
  rect(205*w/500,10,30,20);
  stroke(0,0,255);
  rect(370*w/500,10,30,20);
  //the second stroke calculation
  stroke(255,255,0);
  rect(100*w/500,30,30,20);
  stroke(0,255,255);
  rect(285*w/500,30,30,20);
  stroke(255,0,255);
  rect(460*w/500,30,30,20);
  //stroking white calculation
  stroke((lx+ly+lz)/3);
  rect(210*w/500,60,30,20);
  //numbers of RGB
  textSize(12);
  fill(0);
  text(lx,15*w/500,25);
  text(ly,210*w/500,25);
  text(lz,375*w/500,25);
  //numbers of CPB
  text((lx+ly)/4,105*w/500,45);
  text((ly+lz)/4,290*w/500,45);
  text((lz+lx)/4,465*w/500,45);
  //number of white
  text((lx+ly+lz)/3,215*w/500,75);
  
  textSize(20);
  //bars of colors
  stroke(20);
  fill(lx,ly,lz);
  rect(w/2-165,h-120,330,115);
  //red
  fill(255,0,0);
  text("R",(la-30),li);
  line(la,li,la+300,li);
  ellipse(lx+la,li,15,25);
  //green
  fill(0,255,0);
  text("G",la-30,lj);
  line(la,lj,la+300,lj);
  ellipse(ly+la,lj,15,25);
  //blue
  fill(0,0,255);
  text("B",la-30,lk);
  line(la,lk,la+300,lk);
  ellipse(lz+la,lk,15,25);
  
    if (key=='i'){
    th=abs(250/( mouseSpd+15));
  }
}
void keyPressed(){
   if (key=='1'){
    th=2;
  }else if (key=='2'){
    th=4;
  }else if (key=='3'){
    th=6;
  }else if (key=='4'){
    th=8;
  }else if (key=='5'){
    th=10;
  }else if (key=='6'){
    th=12;
  }
  if (key==' '){
    background(200);
  }
}
