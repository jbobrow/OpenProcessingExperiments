
import processing.pdf.*;


float x,y,lw, lwy, j;
int bar_num=86;
Bar[] newbars = new Bar[bar_num];


void setup(){
	rectMode(CENTER);
	size(1260,296);
//	frameRate(5);

for (int i = 0; i < newbars.length; i++){

	j++;

	if(j>=7){

	j=j*-1;

}



		newbars[i]= new Bar(i*15, j+(random(0,3)));
}

}




void draw(){

		background(0);

for (int i = 0; i<newbars.length; i++){

	newbars[i].display();
	newbars[i].flux();
		
	}	


}

class Bar{
	
	float xpos;
	float wid;


	Bar(float tempxpos, float tempwidth){
	wid=tempwidth;
	xpos=tempxpos;
}

void display(){
noStroke();
	fill(#0000FF);
	rect(xpos, height/2, wid, height-50);

}

void flux(){

wid+=.04;

if(wid>=6){

	wid=wid*-1;

}


	}
}





