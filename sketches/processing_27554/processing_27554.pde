
// Grant Windes
// Project 2 - Yoshi's Eggs

// Global variable declarations

	//Images
	PImage brick;
	PImage eggImg;
	PImage character;
	PImage tree;
	PImage cloudImg1;
	PImage cloudImg2;
	PImage characterLeft;
	PImage characterRight;
	
	//Fonts
	PFont menuFont;
	PFont controlFont;
	
	//Objects
	Yoshi yoshi;
	Cloud[] cloud;
	Egg[] egg;
	
	//variables
	int eggCount;
        int eggPlayCount;
	int gameState;
	int smileyY;
	int smileyX;
        int playerScore;


// Initialize variables
void setup()
{
	//window setup
	size(720,576);
	frame.setTitle("Yoshi's Eggs - Grant Windes");
	frameRate(30);
	
	//load images
	brick = loadImage("images/brick.gif");
	eggImg = loadImage("images/egg.gif");
	character = loadImage("images/yoshiR.gif");
	characterLeft = loadImage("images/yoshiL.gif");
	characterRight = loadImage("images/yoshiR.gif");
	cloudImg1 = loadImage("images/cloud1.gif");
	cloudImg2 = loadImage("images/cloud2.gif");
	tree = loadImage("images/tree.gif");
	
	//load fonts
	menuFont = loadFont("menuFont.vlw");
	controlFont = loadFont("controlFont.vlw");
	
	//gamestate
	gameState = 1; //default 1 = menu
	
	smileyY = 420;
	smileyX = 0;
        playerScore = 0;
	
	//create objects
	yoshi = new Yoshi();
	
	cloud = new Cloud[10];
	//create all cloud objects
	for(int i=0; i < 10; i++){
		if(i == 1 || i == 3 || i == 5 || i == 7 || i == 9){
			cloud[i] = new Cloud(cloudImg1,50+(72*i),randomY());
		}else if(i == 0 || i == 2 || i == 4 || i == 6 || i == 8){
			cloud[i] = new Cloud(cloudImg2,50+(72*i),randomY());
		}
	}
	eggPlayCount = 5;
	eggCount = 50;
	egg = new Egg[50];
	//create all egg objects
	for(int i=0; i<eggCount; i++){
		egg[i] = new Egg(eggImg,randomX(),-48,randomSpeed());
	}
	
}

// Animation/drawing code
void draw()
{
	//clear background
	background(80,159,201);
	
	//menu
	if(gameState == 1){
		menu();
	}
	
	//play game 
	if(gameState == 2){
		drawBrickFloor();
		drawTrees();
		drawYoshi();
		for(int j=0; j<10; j++){
			cloud[j].move();
		}
		
		for(int i=0; i<eggPlayCount; i++){
			egg[i].draw();
		}
		if(playerScore%25 == 0){
                        if(eggPlayCount < eggCount){
                            eggPlayCount++;
                        }
                }
		if(keyPressed == true && key == 'a'){
			yoshi.moveLeft();		
		}else if(keyPressed == true && key == 'd'){
			yoshi.moveRight();
		}
                playerScore++;
	}
	
	//game over
	if(gameState == 3){
		for(int i=0; i<eggCount; i++){
			egg[i].reset();
		}
		pushMatrix();
			translate(100,200);
			fill(255,0,0);
			textFont(menuFont);
			text("GAME OVER!!!!",0,0);
                        translate(100,350);
                        fill(255,255,255);
                        textFont(menuFont);
                        text("Score " + playerScore, 0, 0);
		popMatrix();
                if(keyPressed == true && key == ' '){
                        gameState = 2;
		}else if(mouseX > 140 && mouseX < 510 && mouseY > 410 && mouseY < 465){
			fill(255,0,0);
			text("Play Again?",140,455);
			if(mousePressed == true){
					gameState = 4;
			}
		}else{
			  fill(0);
			text("Play Again?",140,455);
		}
		
	}
	
	//reset game for replay
	if(gameState == 4){
		for(int i=0; i<eggCount; i++){
			egg[i].reset();
		}
		gameState = 2;
                eggPlayCount = 5;
                playerScore = 0;
	}
			
}

//create random X for eggs
int randomX(){
	return int(random(0,672));
}

//create random Y for clouds
int randomY(){
	return int(random(0,280));
}

//created random speed for egg to fall
int randomSpeed(){
	return int(random(2,12));
}

//create floor
void drawBrickFloor(){
	for(int i=0; i < 15; i++){
		image(brick,(i*48),528);
	}
}

void menu(){
	textFont(menuFont);
	pushMatrix();
		translate(280,200);
		if(mouseX > 280 && mouseX < 433 && mouseY > 150 && mouseY < 210){
			fill(169,186,70);
			text("Play!",0,0);
			if(mousePressed == true){
				gameState = 2;
			}
		}else{
			//fill(255);
			//rect(0,-45,153,55);
			fill(255);
			text("Play!",0,0);
		}
	popMatrix();
	drawSmiley();
	pushMatrix();
		translate(400,570);
		textFont(controlFont);
		fill(255);
		text("Controls:  A = Move Left   D = Move Right",0,0);
		textFont(menuFont);
	popMatrix();
}

//create 3 trees
void drawTrees(){
	image(tree,50,432);
	image(tree,280,432);
	image(tree,620,432);
}

//draws yoshi character
void drawYoshi(){
	yoshi.position();	
}

//smiley on splash page for fun
void drawSmiley(){
	//doesnt allow smiley off bottom
	if(smileyY < 475){
		smileyY++;
	}
	//controls movement of smiley
	if(mouseX > smileyX && mouseY  > smileyY && mouseX < (smileyX+100) && mouseY < (smileyY+100)){
		if(smileyX < 0){smileyX = 1;}
		if(smileyX > 620){smileyX = 619;}
		if(mousePressed == true && smileyX > -1 && smileyX < 621 && smileyY <  475 && smileyY > -1){
			smileyX = mouseX-50;
			smileyY = mouseY-50;
		}  
	}
	//create smiley
	smooth();
	fill(255,236,0);
	pushMatrix();
		translate(smileyX,smileyY);
		ellipseMode(CORNER);
		ellipse(0,0,100,100);
		strokeWeight(2);
		pushMatrix();
			translate(35,25);
			beginShape();
				vertex(0,0);
				vertex(0,40);
			endShape();
		popMatrix();
		pushMatrix();
			translate(65,25);
			beginShape();
				vertex(0,0);
				vertex(0,40);
			endShape();
		popMatrix();
		pushMatrix();
			translate(40,45);
			scale(1.1);
			beginShape();
				vertex(-20,25);
				vertex(0,40);
				vertex(20,40);
				vertex(40,25);
			endShape();
		popMatrix();
	popMatrix();
}

//yoshi class and functions to control yoshi character
class Yoshi{
	int yoshiX;
	int yoshiY;
	
	//default constructor
	Yoshi(){
		yoshiX = 360;
		yoshiY = 482;
	}
	
	//move left
	void moveLeft(){
		if(yoshiX > 0){
			yoshiX-= 4;
			character = characterLeft;
		}
	}
	//move right
	void moveRight(){
		if(yoshiX < 672){
			yoshiX+= 4;
			character = characterRight;
		}
	}
	//move yoshi character
	void position(){
		pushMatrix();
			translate(yoshiX,yoshiY);
			image(character,0,0);
		popMatrix();
		
		if(yoshiY < 480){
			yoshiY++;
		}
		
	}
	//return X value
	int getX(){
		return yoshiX;
	}
		
	
}

//class cloud for creating cloud objects
class Cloud{
	PImage cloud;
	int cloudX;
	int cloudY;
	int intialX;
	int intialY;
	Cloud(PImage img, int x, int y){
		cloud = img;
		cloudX = x;
		cloudY = y;
		intialX = 720;
		intialY = y;
	}
	
	//move clouds right to left
	void move(){
		pushMatrix();
			translate(cloudX,cloudY);
			image(cloud,0,0);
		popMatrix();
		if(cloudX > -50){
			cloudX--;
		}else if(cloudX < -48){
			cloudX = intialX;
		}
	}
	
}

//egg class
class Egg{
	PImage egg;
	int eggX;
	int eggY;
	int eggSpeed;
	int rotationSpeed;
	int rotation;
	
	//default constructor
	Egg(){
	}
	
	//constructor
	Egg(PImage img, int x, int y, int speed){
		eggX = x;
		eggY = y;
		egg = img;
		eggSpeed = speed;
		rotationSpeed = int(random(1,6));
	}
	
	//draw eggs
	void draw(){
		pushMatrix();
			translate(eggX,eggY);
			rotate(radians(rotation));
			imageMode(CENTER);
			image(egg,0,0);
			imageMode(CORNER);
		popMatrix();
		gravity();
		if(yoshi.getX() > (eggX-24) && yoshi.getX() < (eggX+24) && eggY < 552 && eggY > 504){
			gameState = 3;
		}else if((yoshi.getX()+48) > (eggX-24) && (yoshi.getX()+48) < (eggX+24) && eggY < 552 && eggY > 504){
			gameState = 3;
		}
	}
	//handle gravity on eggs
	void gravity(){
		eggY += eggSpeed;
		if(eggY > 596){
			eggY = int(random(-100,0));
			eggSpeed = int(random(2,12));
			eggX = int(random(0,672));
		}
		rotation+=rotationSpeed;
	}
	//used for reseting game
	void reset(){
		eggY = -48;		
	}
		
	
}

