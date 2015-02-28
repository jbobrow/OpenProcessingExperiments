
public void setup() {
		size(480, 800);
		  noLoop();
		 

		  }
	public void mousePressed(){
		redraw();
	}

	public void draw() {
		//Color generator
		colorMode(HSB);
		
		//randomly generate 3 brightness vals
		int shadow = (int) (random(45,70));
		int midtone = (int) (random(80,175));
                int highlight = (int) (random(185,210)); //currently unused
		
		
		//Randomly choose a hue, and then find compliments.
		//If i choose, say, 12 o'clock on a color wheel, 
		//compliments will be around 5 and 7 oclock. 
		
		int mainHue = (int) (random(360));
		int compliment1 = (mainHue + 150)%360;
		int compliment2 = (mainHue + 210)%360;
		
		
		
		
		//Painting
                //the painting is just here to show off the color selection, so I made it pretty simple.
                //Some of them look a little like Rothkos. 
                
                
                //background color fill
		background(mainHue,(int) (random(50,100)),(random(255)));
		
		//random deviations
		int deviationDie = (int) (random(2));
		//on zero roll, no fancy extras
		//on 1 roll, paints three "layers" in the center section


		
		int prevLine = (int) (random(200,240));
		
		//simple painting
		if(deviationDie == 0 ){
		stroke(compliment1,(int) (random(150,255)),midtone);
		for (int i =0;i<=480;i++){
			prevLine = (int) (random(prevLine-1,prevLine+2));
			line(i, 800, i , prevLine);	
		}
		prevLine += 400;
		}

		//3-layer midtone
		if(deviationDie == 1){
                        int saturation = (int)(random(255));
			stroke(compliment1,saturation,midtone+30);
			for (int i =0;i<=480;i++){
				prevLine = (int) (random(prevLine-1,prevLine+2));
				line(i, 800, i , prevLine);	
			}
			prevLine += 100;
			stroke(compliment1,saturation,midtone);
			for (int i =0;i<=480;i++){
				prevLine = (int) (random(prevLine-1,prevLine+2));
				line(i, 800, i , prevLine);	
			}
			prevLine += 100;
			stroke(compliment1,saturation,midtone-30);
			for (int i =0;i<=480;i++){
				prevLine = (int) (random(prevLine-1,prevLine+2));
				line(i, 800, i , prevLine);	
			}
			prevLine += 200;
			}
		stroke(compliment2,(int) (255),shadow);
		for (int i =0;i<=480;i++){
			prevLine = (int) (random(prevLine-1,prevLine+2));
			line(i, 800, i , prevLine);	
			
			
		}
               
		stroke(compliment2,(int) (255),shadow);
		for (int i =0;i<=480;i++){
			prevLine = (int) (random(prevLine-1,prevLine+2));
			line(i, 800, i , prevLine);	
			
			
		}
		
		

	}


