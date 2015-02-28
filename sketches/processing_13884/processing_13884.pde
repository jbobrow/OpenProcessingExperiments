

int w, h;
Rock rocky;
MossGroup mg8;
float ozone [];
boolean startA = false;


void setup(){
	size( 600, 600 );
	w = width; h = height;
	rocky = new Rock();
	mg8 = new MossGroup();
	noFill();
	smooth();
	stroke( 0, 20 );
	background( 255, 10);
	textSize( 80 );
	textAlign( RIGHT, BOTTOM );
	
	//get data	
	String[] tempD = loadStrings("ozone_data.txt");
	ozone = float(split(tempD[0],','));
	
}

int bT = 0;
void draw(){

//saveFrame("stills/anty####.png");

if( startA ){
	//blend background
	colorMode(RGB,255);
	fill( 255, 10 );
	noStroke();
	rect( 0, 0, w, h );
	
	//if cracks are all rendered wait for 50 frames, then start rendering moss
	if( rocky.finD && rocky.to > 50 ){
		if( !rocky.popd ) rocky.populate(); //generate moss objects
		mg8.render(); //render moss group (mg8)
	}
	rocky.render();
}
}

//start after mouse clicked
void mouseClicked(){
	startA = ( !startA ) ? true : false;
}

