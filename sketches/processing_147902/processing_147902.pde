
boolean active = true;
PImage startBackGround;

void setup() {
    frameRate(60);
    size(600,455);
    
    //player1 = new Dodger(5, width, height, image ) ); 
    //player2 = new Dodger(5, width, height, image ) );
    String bg = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Crunchers_Dodgeball_800x600.jpg";
    startBackGround = loadImage(bg);
    
  
}
  
  
void draw() {

    if(active) { //game starts
    
    //load image background
    image(startBackGround, 0 , 0);
    
    // One Versus One
    fill(92,227,236);
    rect(180, 50, 250 , 50, 10, 10, 10, 10);
    textSize(30);
    fill(76,140,250);
    text("One Versus One", 195, 85);

    // Two Versus Two
    fill(92,227,236);
    rect(180, 120, 250 , 50, 10, 10, 10, 10);
    textSize(30);
    fill(76,140,250);
    text("Two Versus Two", 195, 155);
    
    // Instruction
    fill(92,227,236);
    rect(180, 360, 250 , 50, 10, 10, 10, 10);
    textSize(33);
    fill(260,20,20);
    text("HOW TO PLAY", 193, 400);
    
    //check if mouse hoover over the "One Versus One"
    if ( mouseX > 180 && mouseX < 430 && mouseY > 50 && mouseY < 100 ) {
        fill(117,242,253);
        rect(180, 50, 250, 50, 10, 10, 10, 10);
        textSize(30);
        fill(76,140,250);
        text("One Versus One", 195, 85); 
    // check if mouse hoover over the "Two Versus Two"
    } else if ( mouseX > 180 && mouseX < 430 && mouseY > 120 && mouseY < 170 ) {
        fill(117,242,253);
        rect(180, 120, 250, 50, 10, 10, 10, 10);
        textSize(30);
        fill(76,140,250);
        text("Two Versus Two", 195, 155);
    // check if the mouse hoover over the "HOW TO PLAY"
    } else if ( mouseX > 180 && mouseX < 430 && mouseY > 360 && mouseY < 410 ) {
        fill(117,242,253);
        rect(180, 50, 250, 50, 10, 10, 10, 10);
        textSize(30);
        fill(76,140,250);
        text("HOW TO PLAY", 193, 400);  
    
    }

}
