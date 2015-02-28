
String[] words = {"You","know",".",".",".","You","are","triangular.",
  "Did","you","see","your","self","dis-","ap-","pear?",
  "You","began","some","THING","you","can","not","stop",
  "And","all","for","what",".",".",".","?",
  "Your","a-","chieve-","ments","have","been","eat-","en.",
  "You,","or","maybe","you?",".",".",".","Hmm.",
  "I","lost","you.","Oh,","well,","you","are","lost.",
  "It","would","not","be","the","first","time,","indeed."};
String[] words2 = {"Triangle","knows",".",".",".","He","is","triangular.",
  "Did","he","see","him","self","dis-","ap-","pear?",
  "He","began","some","THING","he","can","not","stop",
  "And","all","for","what",".",".",".","?",
  "His","a-","chieve-","ments","have","been","worth-","while.",
  "Triangle","is","lost","in","the","crowd",".","Hmm.",
  "He","is","lost.","Oh,","we","will","miss","him.",
  "It","would","not","be","the","first","time,","indeed."};
 
float X=width/2,Y=height/2,S=10,edge=100;
int wins=0, dont=255, wordlim=1, greenness=255;
int[] tempX= {100,100,100,100,100,100,100,100};
float velX=.5,velY=.5;
color gColor=color(255);
ArrayList bullets;
boolean expanding=true, click=false, U=false, L=false, D=false,
  R=false, Sp=false;
PFont font;
 
void setup() {
  size(800,500);
  background(0);
  bullets = new ArrayList();
  frameRate(60);
  font=loadFont("Georgia-Bold-48.vlw");
}
 
void draw() {
  gColor=color(255-int(float(abs(64-wins))/64*255),int(float(abs(64-wins))/64*255),255-int(float(abs(32-wins))/32*255));
  if(wins>0)stroke(gColor);
  else stroke(255);
  if(wins==10) S=4;
  strokeWeight(edge);
  if(wins<64) fill(0,20);
  else fill(0,20);
  rect(edge/2,edge/2,width-edge,height-edge);
  fill(0);
  strokeWeight(1);
  if(X+velX<width-S*sqrt(3)/2-edge+1)
  if(X+velX>S*sqrt(3)/2+edge-1) X+=velX;
  else {X=S*sqrt(3)/2+edge;velX=1;}
  else {X=width-S*sqrt(3)/2-edge;velX=-1;}
  if(Y+velY<height-S/2-edge)
  if(Y+velY>S+edge) Y+=velY;
  else {Y=S+edge;velY=1;}
  else {Y=height-S/2-edge;velY=-1;}
  if(wins==64) {stroke(255,255,0);fill(255,255,0);S=6;}
  friangle(X,Y,S);
  if(wins>0)stroke(gColor);
  else stroke(255);
  if (wins==64) stroke(70);
  if(U) {if(velY!=.5) velY-=.5; else velY-=1;}
  if(D) {if(velY!=-.5) velY+=.5; else velY+=1;}
  if(L) {if(velX!=.5) velX-=.5; else velX-=1;}
  if(R) {if(velX!=-.5) velX+=.5; else velX+=1;}
  if(Sp&&wins!=64) bullets.add(new bullet(velX,velY,X,Y));
  for(int i=0;i<bullets.size();i++) {
	bullet b = (bullet) bullets.get(i);
	b.display();
	if(b.getDead()) bullets.remove(i);
	if(b.getX()<X+S&&b.getX()>X-S&&b.getY()<Y+S&&b.getY()>Y-S)
    	{
	b.setVel(velX,velY);
    	}
  }
  textFont(font,30);
  fill(int(float(abs(64-wins))/64*255),255-int(float(abs(64-wins))/64*255),255-int(float(abs(32-wins))/32*255));
  for(int i=0;i<8;i++){
  tempX[i]=100;
  }
  tempX[2]=90;
  tempX[4]=80;
  textAlign(LEFT);
  if(wins==64)
	if(frameCount%10==0) fill(20);
	else {fill(0,greenness,0,greenness);}
  for(int i=0;i<words.length;i++){
	if(i<wins) {
	if (i<8) {text(words2[i],tempX[0],130);tempX[0]+=5+textWidth(words2[i]);}
	else if (i<16) {text(words2[i],tempX[1],170);tempX[1]+=5+textWidth(words2[i]);}
	else if (i<24) {text(words2[i],tempX[2],210);tempX[2]+=5+textWidth(words2[i]);}
	else if (i<32) {text(words2[i],tempX[3],250);tempX[3]+=5+textWidth(words2[i]);}
	else if (i<40) {text(words2[i],tempX[4],290);tempX[4]+=5+textWidth(words2[i]);}
	else if (i<48) {text(words2[i],tempX[5],330);tempX[5]+=5+textWidth(words2[i]);}
	else if (i<56) {text(words2[i],tempX[6],370);tempX[6]+=5+textWidth(words2[i]);}
	else if (i<64) {text(words2[i],tempX[7],410);tempX[7]+=5+textWidth(words2[i]);}
	}
  }
  for(int i=0;i<8;i++){
  tempX[i]=100;
  }
  tempX[2]=90;
  if(wins==64) {
	if(frameCount%15==0&&wordlim<64) wordlim++;
  for(int i=0;i<wordlim;i++){
	fill(255-int(float(abs(64-i))/64*255),int(float(abs(64-i))/64*255),255-int(float(abs(32-i))/32*255));
	if(i<wins) {
	if (i<8) {text(words[i],tempX[0],130);tempX[0]+=5+textWidth(words[i]);}
	else if (i<16) {text(words[i],tempX[1],170);tempX[1]+=5+textWidth(words[i]);}
	else if (i<24) {text(words[i],tempX[2],210);tempX[2]+=5+textWidth(words[i]);}
	else if (i<32) {text(words[i],tempX[3],250);tempX[3]+=5+textWidth(words[i]);}
	else if (i<40) {text(words[i],tempX[4],290);tempX[4]+=5+textWidth(words[i]);}
	else if (i<48) {text(words[i],tempX[5],330);tempX[5]+=5+textWidth(words[i]);}
	else if (i<56) {text(words[i],tempX[6],370);tempX[6]+=5+textWidth(words[i]);}
	else if (i<64) {text(words[i],tempX[7],410);tempX[7]+=5+textWidth(words[i]);}
	}
  }
  }
  textAlign(CENTER);
  fill(0,dont);
  textFont(font, 250);
  if(!Sp) text("DON'T",width/2-15,height/2);
  fill(255);
  textFont(font,48);
  if(!Sp) text("Press [Space]",width/2,height/2);
}
 
void friangle(float x, float y, float s) {
  triangle(x,y-s,x+s*sqrt(3)/2,y+s/2,x-s*sqrt(3)/2,y+s/2);
}
 
void mousePressed() {
  click=true;
}
 
void mouseReleased() {
  click=false;
}
 
void keyPressed() {
  if(wins<64){
  if (key=='w') U=true;
  if (key=='a') L=true;
  if (key=='s') D=true;
  if (key=='d') R=true;
  if (key==' ') Sp=true;
  }
  else {U=false;L=false;R=false;D=false;Sp=false;}
}
 
void keyReleased() {
  if (key=='w') U=false;
  if (key=='a') L=false;
  if (key=='s') D=false;
  if (key=='d') R=false;
  //if (key==' ') Sp=false;
}
 
class bullet {
 
  float x,y,xv,yv;
  int bsize=4, redness=255, otherness=0;
 
  bullet(float velx, float vely, float _X, float _Y) {
	x=_X;
	y=_Y;
	xv=velx;
	yv=vely;
  }
 
  void display() {
    	fill(redness,0,0);
    	if(wins==64&redness>70) {stroke(redness,otherness,otherness); if(otherness<70) otherness+=1;}
    	if(wins==64&&frameCount%5==0) redness-=1;
    	if(redness==30) greenness=0;
	friangle(x,y,bsize);
	//yv+=.1;
	x+=xv;
	y+=yv;
  if(x<width-bsize-edge)
  if(x>bsize+edge) x+=xv;
  else {x=bsize+edge;xv*=-.7;}
  else {x=width-bsize-edge;xv*=-.7;}
  if(y<height-bsize-edge)
  if(y>bsize+edge) y+=yv;
  else {{y=bsize+edge;yv*=-.7;if(wins<64){if(expanding)if(edge>1)edge-=1;else {expanding=false;if(wins<64)wins+=1;} else if(edge<100)edge+=1; else {expanding=true;}}}}
  else {y=height-bsize-edge;yv*=-.7;}
  }
 
  float getX() {
	return x;
  }
 
  float getY() {
	return y;
  }
 
  void setVel(float _velX, float _velY) {
	if(_velX!=0) xv+=_velX;
	else xv=-.7*xv - (xv)/abs(xv);
	if(_velY!=0) yv+=_velY;
	else yv=-.7*yv - (yv)/abs(yv);
  }
   
  void setPos(int _X, int _Y) {
	x+=_X;
	y+=_Y;
  }
 
  boolean getDead() {
	if(xv==0&&yv==0) return true;
	else return false;
  }
}

