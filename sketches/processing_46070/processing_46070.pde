
float counter = 0;

void setup(){
	size(720,420,P2D);

	noiseSeed(19);

	frameRate(25);


}


void draw(){

	loadPixels();


	for(int y =0 ; y < height; y++){
		for(int x =0 ; x < width; x++){
			if(dist(width/2,height/2,x,y)<120){

				pixels[y*width+x] = color( (noise( (counter/30.0) *y*width+x) * noise((counter*y*width+x)/30.3))*255);
			}else{

				pixels[y*width+x] =  color((noise( (counter/29.0)*y*width+x))*noise((counter*y*width+x)/29.33)*255);

			}	
		}
	}

	if(frameCount%50<25){
		counter++;
	}

}

