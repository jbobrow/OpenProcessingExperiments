

import processing.core.*;

 void setup(){
		size(640,440);
		background(255);
		smooth();//noFill();
		strokeWeight((float).3);


		
	}
	float y=0;
	float truc=1;
void draw(){
	background(255);
	float angle=0;
	float rh=90;
	float rv=90;
	int click=2;
	for(int x=0;x<width;x++){
		translate(y*200,y);
		if(this.mousePressed==true){
			click++;
			if(click==4){
				click=0;
			}
		}
		if(click==1){
			noFill();
		stroke(random(120),random(50),12);
		}
		if(click==2){
			noFill();
		stroke(random(255)*y,random(100),random(150)*y);
		}
		if(click==3){
		noStroke();
	
		if(y>0){
		fill(84*y,random(100,232)*y,26*y,100);
		}
		else{
			fill(241,255,18,100);
		}
		}
		//ellipse(width/4+70,height/2,rh*y,rv*y);
		ellipse(truc*y*(float)0.75,height/2+random(-10,10)*y*(float).2,rh*y*(float)1.65,rv*y*(float)1.65);
		//angle=+1,+2,3,4,etc..
		y=(float)1.5*sin(angle+=1);
		truc+=0.1;
		if(truc>=5000){
			truc=truc*(-1);
			truc*=2*sin(angle);
		}
		
	}
	}
	
	


