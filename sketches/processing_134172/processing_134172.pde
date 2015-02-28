
float x = 100;
float xspd;
float xacc;
float y;
float yspd=1;
float x=mouseY;
float y=mouseX;
float c;
void setup(){
  size(500,500);
  colorMode(HSB);
}
void draw(){
  if (key=='b'){
    background(200);
  }else if (key=='n'){
  }
  fill(255);
  rect(0,0,70,85);
  fill(0);
  text(mouseX,10,10);
  text(mouseY,10,20);
  text(x,15,30);
  text(y,15,40);
  text(xspd,20,50);
  text(yspd,20,60);
  text(xacc,30,70);
  fill(c,240,240);
  text(c,10,80);
  fill(c,240,240);
  ellipse(y,x,20,20);
  
  x+=xspd;
  xspd+=xacc;
  c++;
  y+=yspd;
  xacc=x/100;
  if(y>=width-150){
    yspd=-abs(yspd);
  }else if(<=150){
    yspd=abs(yspd);
  }
  if(x>=height-25){
    xspd=-abs(xspd*.99);
  }else if(x<=0){
    xspd=abs(xspd*.99);
  }
  if(c>=255){
    c=0; 
  }
  if(mousePressed){
    ellipse(y,x,15,25);
    
    xspd=mouseY-pmouseY;
    yspd=mouseX-pmouseX;
    xacc=0;
  }else{xacc=1;}
  if ((keyPressed)&&(key==' ')){
    background(200);
  }

}
    

