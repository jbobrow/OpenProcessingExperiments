
int counter;

void setup() {  //setup function called initially, only once
  size(500, 250);

void initialize() {
  addScreen("mylevel", new MyLevel(screenWidth, screenHeight));  

