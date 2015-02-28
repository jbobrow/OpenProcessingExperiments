
import processing.video.*;

MovieMaker movie;

int iterations=2;
char renderer='b';
float cx,cy;
float shrink,shrinkv,multi;
int Translate;
boolean changed;
int counter;
float maxCount;
int screenHeight;
int screenWidth;
PImage myImage;

int imageHeight;
int imageWidth;

int imageX;
int imageY;

boolean rec;

void setup() {
        rec = true;
        
        screenHeight = 720;
        screenWidth = 1280;
        
        imageHeight = 800;
        imageWidth = 800;
        
        imageX = int((screenWidth/2.0) - (imageWidth/2.0));
        imageY = int((screenHeight/2.0) - (imageHeight/2.0));
        
        myImage = createImage(imageWidth, imageHeight, RGB);

	size(screenWidth,screenHeight,P2D);
	shrink=10.0/float(imageWidth);
	shrinkv=shrink;
	Translate=imageWidth/2;
	multi=25.5;
	myImage.loadPixels();
        loadPixels();
        counter = 1;
        background(0);
        maxCount = 1000.0;
        movie = new MovieMaker(this, width, height, "julia.mov", 32, MovieMaker.ANIMATION, MovieMaker.LOSSLESS);
}

void draw() {
        counter = counter + 1;
        if (counter > maxCount) {
           counter = 1;
        }
        float fade1 = abs(sin((float(counter - 1) / maxCount) * PI * 3.1));
        float fade2 = abs(sin((float(counter - 1) / maxCount) * PI * 8.0));

        float xo1 = cos((float(counter - 1) / maxCount) * PI * 2.0) * ((imageWidth / 9.0) * fade1);
        float yo1 = sin((float(counter - 1) / maxCount) * PI * 2.0) * ((imageWidth / 9.0) * fade1);
        float xo2 = cos((float(counter - 1) / (maxCount / 5.0)) * PI * 2.0) * ((imageWidth / 5.0) * fade2);
        float yo2 = sin((float(counter - 1) / (maxCount / 5.0)) * PI * 2.0) * ((imageWidth / 5.0) * fade2);


	cx=(float(mouseX-Translate) + xo1 + xo2) *shrink;// ;
	cy=(float(mouseY-Translate) + yo1 + yo2) *shrink;// + yo;
	cx=((float(imageWidth)/2.0) -Translate + xo1 + xo2) *shrink;// ;
	cy=((float(imageHeight)/2.0) -Translate + yo1 + yo2) *shrink;// + yo;
        //println(cx);

	if(changed) {
		//background(0, 0.0);
		switch(renderer) {
		default:
                for (int c=0; c<= 100000; c++){
                  float x = floor(random(imageWidth));
                  float y = floor(random(imageHeight));
				float zx=(x-Translate)*shrinkv;
				float zy=(y-Translate)*shrinkv;
				for(int i=0; i<iterations; i++) {
					float zex=zx;
					zx=zx*zx-zy*zy+cx;
					zy=2*zy*zex+cy;
				}
				if(sqrt(zx*zx+zy*zy)<2) {
					myImage.pixels[int(x*imageWidth+y)]=color(0);
				} else {
                                        myImage.pixels[int(x*imageWidth+y)]=int(myImage.pixels[int(x*imageWidth+y)] * fade1);
                                }
                }
/*		
                for(float x=0; x<width; x++) {
			for(float y=0; y<height; y++) {
			}
		}
*/
		break;
		case 'a':
                for (int c=0; c<= 100000; c++){
                  float x = floor(random(imageWidth));
                  float y = floor(random(imageHeight));
			//for(float x=0; x<width; x++) {
				//for(float y=0; y<height; y++) {
					float zx=(x-Translate)*shrinkv;
					float zy=(y-Translate)*shrinkv;
					for(int i=0; i<iterations; i++) {
						float zex=zx;
						zx=zx*zx-zy*zy+cx;
						zy=2*zy*zex+cy;
		
						if(sqrt(zx*zx+zy*zy)<2) {
							myImage.pixels[int(x*imageWidth+y)]=color(255-i*multi);
						} else {
                                                        myImage.pixels[int(x*imageWidth+y)]=int(myImage.pixels[int(x*imageWidth+y)] * fade2);
                                                }
					}
				//}
			//}
                }
		break;
		}
		myImage.updatePixels();
                translate(screenWidth/2, screenHeight/2);
                rotate(90.0 * TWO_PI/360.0);
                translate(-screenWidth/2, -screenHeight/2);
                image(myImage, imageX, imageY);
		changed=true;
                if (rec) {
                  movie.addFrame();
                }
                
	}
}

void keyPressed() {
        if (key==ESC){
                movie.finish();
                println("STOP");
        } else   if (key==' ' && rec==false){
                rec=true;
                println("REC");
        }
        //If SPACE key is pressed and recording is on, turn it off.
        else if (key==' ' && rec==true){
                rec=false;
                println("PAUSE");
        } else if(key==CODED) {
		if(keyCode==LEFT) {
			iterations=(iterations>2) ?iterations-1:iterations;
			multi=float(255)/float(iterations);
		} else if(keyCode==RIGHT) {
			iterations=(iterations<100) ?iterations+1:iterations;
			multi=float(255)/float(iterations);
		} else if(keyCode==RIGHT) {
			iterations=(iterations<100) ?iterations+1:iterations;
			multi=float(255)/float(iterations);
		} else if(keyCode==UP){
			shrinkv-=.001;
		} else if(keyCode==DOWN){
			shrinkv+=.001;
		}

	} else {
		renderer=key;
	}
	changed=true;
}

void mouseMoved() {
	changed=true;
}


