

import ddf.minim.*;
import rita.*;

	
  //declare sound objects
  private Minim minim;
        private AudioPlayer testsound;
	private AudioSnippet beep;
	private AudioSnippet ring;
	private AudioSnippet pickup;
	
	//declare fonts
	private PFont font1,font2;
	
	//declare text objects
	private RiText phone, screen, Fbutton, Ibutton, Obutton, Nbutton, Abutton,
		Rbutton, Obutton2, Sbutton, Ebutton, onbutton, offbutton,title1, title2;
	
	//initialize phone to be off
	private boolean isOn = false;
	

	public void setup() {
		size(600,700);
		background(100,140,20);
		
		//instantiate sound objects
		minim = new Minim(this);
		testsound = minim.loadFile("WELH.mp3");
		beep = minim.loadSnippet("beep.wav");
		ring = minim.loadSnippet("phonecall.mp3");
		pickup = minim.loadSnippet("pickup.mp3");
		
		//and fonts
		font1 = createFont("Arial Narrow",100);
		font2 = createFont("Arial Black", 100);
		
		//assemble phone
		phone = new RiText(this,"n",72,585);
		phone.textFont(font1,1020);
		screen = new RiText(this,"o",213,360);
		screen.textFont(font1,420);
		title1 = new RiText(this,"FIONA",265,255);
		title1.textFont(font1,25);
		title1.setVisible(false);
		title2 = new RiText(this,"FONE",265,285);
		title2.textFont(font1,38);
		title2.setVisible(false);
		onbutton = new RiText(this,"on",270,395);
		onbutton.textFont(font1,20);
		onbutton.showBoundingBox(true);
		offbutton = new RiText(this,"off",330,395);
		offbutton.textFont(font1,20);
		offbutton.showBoundingBox(true);
		offbutton.boundingBoxFill(150);
		
		//create button objects
		Fbutton = new RiText(this,"f",230,450);
		Fbutton.textFont(font2,30);
		Fbutton.showBoundingBox(true);
		Ibutton = new RiText(this, 'i', 290,450);
		Ibutton.textFont(font2,30);
		Ibutton.showBoundingBox(true);
		Obutton = new RiText(this,'o',345,450);
		Obutton.textFont(font2,30);
		Obutton.showBoundingBox(true);
		Nbutton = new RiText(this,'n',230,505);
		Nbutton.textFont(font2,30);
		Nbutton.showBoundingBox(true);
		Abutton = new RiText(this,'a',290,505);
		Abutton.textFont(font2,30);
		Abutton.showBoundingBox(true);
		Rbutton = new RiText(this,'r',345,505);
		Rbutton.textFont(font2,30);
		Rbutton.showBoundingBox(true);
		Obutton2 = new RiText(this,'O',230,560);
		Obutton2.textFont(font2,30);
		Obutton2.showBoundingBox(true);
		Sbutton = new RiText(this,'s',290,560);
		Sbutton.textFont(font2,30);
		Sbutton.showBoundingBox(true);
		Ebutton = new RiText(this,'e',345,560);
		Ebutton.textFont(font2,30);
		Ebutton.showBoundingBox(true);
		
		
	}

	public void draw() {
		background(100,140,20);
		if (mousePressed == true){
			
			//define the fields of clickability
			int[] row1 = {420,450};
			int[] row2 = {475,505};
			int[] row3 = {530,560};
			int[] col1 = {225,265};
			int[] col2 = {280,320};
			int[] col3 = {335,375};
			int[] offx = {310,360};
			int[] offy = {375,400};
			
			//if the phone is on, make the buttons respond to clicks
			if (isOn){
				if (clickedIn(col1, row1)){
					Fbutton.showBoundingBox(true);
					Fbutton.boundingBoxFill(150);
					selected(Fbutton, "WELH.mp3");
				}
				else if (clickedIn(col2, row1)){
					selected(Ibutton, "family.wav");
				}
				else if (clickedIn(col3, row1)){
					selected(Obutton, "sally.mp3");
				}
				else if (clickedIn(col1, row2)){
					selected(Nbutton, "mom.mp3");
				}
				else if (clickedIn(col2, row2)){
					selected(Abutton,"WOO.wav");
				}
				else if (clickedIn(col3, row2)){
					selected(Rbutton,"http://stream.bsrlive.brown.edu:8000/src1");
				}
				else if (clickedIn(col1, row3)){
					selected(Obutton2,"sing.mp3");
				}
				else if (clickedIn(col2, row3)){
					selected(Sbutton,"bobby.wav");
				}
				else if (clickedIn(col3, row3)){
					selected(Ebutton,"work.mp3");
				}
				else if (clickedIn(offx,offy)){
					isOn = false;
					title1.setVisible(false);
					title2.setVisible(false);
					deselect();
					testsound.pause();
					onbutton.boundingBoxFill(100,140,20);
					offbutton.boundingBoxFill(150);
				}
				
				//otherwise, deselect the buttons and stop the audio file
				else{
					deselect();
					testsound.close();
					testsound = minim.loadFile("WELH.mp3");
				}
			}
			//if the phone is off, only the on button is clickable
			else{
				int[] onx = {260,290};
				int[] ony = {375, 400};
				if (clickedIn(onx,ony)){
					isOn = true;
					title1.setVisible(true);
					title2.setVisible(true);
					onbutton.boundingBoxFill(150);
					offbutton.boundingBoxFill(100,140,20);
				}
			}
		}
	}
	
	//enables the user to manipulate the phone using the keyboard
	public void keyPressed(){
		if (isOn){
			if (key == 'f'){
				selected(Fbutton,"WELH.mp3");
			}
			if (key == 'i'){
				selected(Ibutton, "family.wav");
			}
			if (key == 'o'){
				selected(Obutton, "sally.mp3");
			}
			if (key == 'n'){
				selected(Nbutton, "mom.mp3");
			}
			if (key == 'a'){
				selected(Abutton,"WOO.wav");
			}
			if (key == 'r'){
				selected(Rbutton,"http://stream.bsrlive.brown.edu:8000/src1");
			}
			if (key == 'O'){
				selected(Obutton2,"sing.mp3");
			}
			if (key == 's'){
				selected(Sbutton,"bobby.wav");
			}
			if (key == 'e'){
				selected(Ebutton,"work.mp3");
			}
		}
	}
	
	public void stop(){
		minim.stop();
		super.stop();
	}
	
	public boolean clickedIn(int[] x, int[] y){
		if (x[0] < mouseX && mouseX < x[1]){
			if (y[0] < mouseY && mouseY < y[1]){
				return true;
			}
		}
		return false;
	}
	
	//resets testsound to a new file
	public void switchSound(String filename){
		testsound = minim.loadFile(filename);
		testsound.play();
	}
	
	//causes the button to beep, initializes ringing for a randomly determined period & ends
	//with the "pick up" sound
	public void callSounds(){
		beep.play();
		while (beep.isPlaying()){
			
		}
		ring.play();
		int start = millis();
		float rand = random(1000,10000);
		while (ring.isPlaying()){
			if (millis() - start > rand){
				ring.pause();
				pickup.play();
				ring.rewind();
				pickup.rewind();
				beep.rewind();
			}
		}
	}
	
	public void selected(RiText button, String filename){
		deselect();
		button.showBoundingBox(true);
		button.boundingBoxFill(150);
		testsound.close();
		callSounds();
		switchSound(filename);
	}
	
	//fills all bounding boxes of buttons with the background color
	public void deselect(){
		Fbutton.boundingBoxFill(100,140,20);
		Ibutton.boundingBoxFill(100,140,20);
		Obutton.boundingBoxFill(100,140,20);
		Nbutton.boundingBoxFill(100,140,20);
		Abutton.boundingBoxFill(100,140,20);
		Rbutton.boundingBoxFill(100,140,20);
	        Obutton2.boundingBoxFill(100,140,20);
		Sbutton.boundingBoxFill(100,140,20);
		Ebutton.boundingBoxFill(100,140,20);
		
	}


