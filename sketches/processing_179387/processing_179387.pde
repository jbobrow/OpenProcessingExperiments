
int colour=#FFB2F1;
int coclour2=#FFB2F1;
float r=0,x=0,y=0;
void setup() {
  size(500, 500);
}

void draw() {
  background(#FFF2FE);
  ddd();
    textSize(100);
  fill(colour);

  text("รักนะ 6/8 " , 50, 200);
  text("     อิอิ" , 50, 300);
  if (x>-25&&mouseX>150&&mouseX<350&&mouseY>100&&mouseY<350) {
   colour=255;r=r-2;x--;y--;coclour2=#FF3939;
   if(r<-100){r++;}
  if(x<-25){x++;}
   if(y<-25){y++;}
  } else {
    colour= #FFB2F1;r=0;x=0;y=0;coclour2=#FFB2F1;
  }
 if(r<-100){r++;}
  if(x<-25){x++;}
   if(y<-25){y++;}
}
void ddd(){
noStroke();
  fill(coclour2);
  ellipse(150, 150, 250+r, 250+r);
  ellipse(350, 150, 250+r, 250+r);
  fill(#FFF2FE);
  rect(30, 185, 440, 100);
  fill(coclour2);
  triangle(30-x, 185, 470+x, 185, 250, 450+y);
}
