
PFont f;                          // STEP 2 Declare PFont variable
  
void setup() {
  size(200,200);
  f = createFont("lato",24,true); // STEP 3 Create Font
}

void draw() {
  background(255);
  textFont(f,26);                 // STEP 4 Specify font to be used
  fill(200,50,100);                        // STEP 5 Specify font color 
  text("Hello Strings!",10,100);  // STEP 6 Display Text
}

