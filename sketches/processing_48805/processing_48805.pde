

void setup(){
	size(640,420,P2D);
	background(0);
	smooth();

	noiseSeed(19);
}


void draw(){

	int x = 1;//(int)( (noise(-frameCount/33.4)-0.5)*5. );

	int y = 0;//(int)( (noise(frameCount/33.3)-0.5)*5. );

	pushMatrix();


	if(frameCount%100==0)
	{
	translate(0,height);
	scale(0,-1);
	}


	if(frameCount%80==0)
	g.filter(INVERT);

	tint(#FaFFFF,5);
	image(g,random(-5,5),random(-5,5));




	for(int i =0 ;i<2000;i++){



		if(i%50==0)
			stroke(0);
		else
			stroke(255);


		point(noise(frameCount/3000.0+i/300.3)*width-width/5.,noise(-frameCount/400.0+i/300.2)*height*1.5-height/2.);	
	}

	blend(g,0,0,width,height,x,y,width+x,height+y,BLEND);
	blend(g,0,0,width,height,x,y,width+x,height+y,OVERLAY);


	symmetry();

	popMatrix();
}

void symmetry(){

	loadPixels();
	for(int y =  0; y < height;y++){
		for(int x = width / 2 ; x < width;x++){
			int sel = y*width+x;
			int src = y*width-x+width;
			pixels[sel] = pixels[src];
		}
	}


}


