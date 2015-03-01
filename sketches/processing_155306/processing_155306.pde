
PImage img, newimg;
PFont myFont, instrFont;
String[] imgname, msgs;
int msgscount = 0;

// pattern01
int[] x_01, y_01, rectwidth_01, rectheight_01;
int num_01 = 180;

// pattern02
int[] x_02, rectwidth_02;
int num_02 = 50;
int countwidth_02 = 0;

// pattern03
int[] y_03, rectheight_03, offsetX_03;
int num_03 = 20;
int countheight_03 = 0;


void setup() {
	size(500,650);
	background(#ffffff);

	// instruction text
	String instructions = "This is the Postcard generator\n\nPress \"1\" to use the first pattern\nPress \"2\" to use the second pattern\nPress \"3\" to use the third pattern\nPress \"r\" to reload an image and text\n\nPress a key";
	// String instructions = "This is the Postcard generator\n\nPress \"1\" to use the first pattern";
	instrFont 		= createFont("Georgia", 12);
	textFont(instrFont);
	fill(0);
	text(instructions, 20, 30);

	// pick a random text
	msgscount = (int)random(0,3);
	// pick a random photo
	imgname 	= new String[5];
	imgname[0] 	= "photo01.jpg";
	imgname[1] 	= "photo02.jpg";
	imgname[2] 	= "photo03.jpg";
	imgname[3] 	= "photo04.jpg";
	imgname[4] 	= "photo05.jpg";
	img 		= loadImage(imgname[(int)random(0,5)]); 

	// for pattern 01
	x_01 			= new int[num_01];
	y_01			= new int[num_01];
	rectwidth_01 	= new int[num_01];
	rectheight_01	= new int[num_01];
	// for pattern 02
	x_02 			= new int[num_02];
	rectwidth_02 	= new int[num_02];
	// for pattern 03
	y_03 			= new int[num_03];
	rectheight_03 	= new int[num_03];
	offsetX_03 		= new int[num_03];




}

void draw() {

}

void mousePressed() {

}

void keyPressed() {
	if (key == 's' || key == 'S') saveFrame("postcard_"+frameCount+".jpg");
	if (key == '1') {
		background(#ffffff);
		pattern01();
		displayText();
	}
	if (key == '2') {
		background(#ffffff);
		pattern02();
		displayText();
	} 
	if (key == '3') {
		background(#ffffff);
		pattern03();
		displayText();
	} 
	if (key == 'r' || key == 'R') {
		msgscount = (int)random(0,3);
		img = loadImage(imgname[(int)random(0,5)]); 
		background(#ffffff);
		pattern02();
		displayText();
	}
}







void displayText() {
	myFont 		= createFont("Arial", 14);
	textFont(myFont);
	fill(0);
	msgs 		= new String[3];
	msgs[0] 	= "Welcome to creative coding. Year 2014.";
	msgs[1] 	= "Hello from Belarus, latest dictatorship in Europe.";
	msgs[2] 	= "Go outside today. It's a beautiful world.";
	text(msgs[msgscount], 20, 620);
}

void pattern01() {
	for (int i=0; i<num_01; i++) {
		x_01[i] = (int)random(width);
		y_01[i] = (int)random(height);
		rectwidth_01[i] = (int)random(20,200);
		rectheight_01[i] = (int)random(5,100);
		newimg = img.get(x_01[i],y_01[i], rectwidth_01[i], rectheight_01[i]);
		image(newimg, x_01[i]+20,y_01[i]+20);
	}	
}

void pattern02() {
	for (int i=0; i<num_02; i++) {
		int step = (int)random(1,10);
		countwidth_02 += step;
		x_02[i] = countwidth_02;
		rectwidth_02[i] = (int)random(5,20);
		newimg = img.get(x_02[i], 0, rectwidth_02[i], height);
		image(newimg, x_02[i]+20, 20);
		countwidth_02 += rectwidth_02[i];
		if (countwidth_02>width) countwidth_02=0;
	}	
}

void pattern03() {
	for (int i=0; i<num_03; i++) {
		int step = (int)random(0,5);
		countheight_03 += step;
		y_03[i] = countheight_03;
		int rectwidth = 460;
		rectheight_03[i] = (int)random(5,70);
		offsetX_03[i] = (int)random(-10,10);
		newimg = img.get(0, y_03[i], rectwidth, rectheight_03[i]);
		image(newimg, 20+offsetX_03[i], y_03[i]+20);
		countheight_03 += rectheight_03[i];
		if (countheight_03>height) countheight_03=0;
	}		
}


