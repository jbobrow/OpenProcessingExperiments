
/* @pjs font = "bitter_bold.ttf, bitter_regular.ttf";
        preload = "bg.png, drink_0.png, drink_1.png, drink_2.png, drink_3.png, drink_4.png, drink_5.png, food_0.png, food_1.png, food_2.png, food_3.png, food_4.png, food_5.png, food_6.png, food_7.png, food_8.png, food_9.png, shoes_0.png, shoes_1.png, shoes_2.png, shoes_3.png, shoes_4.png, shoes_5.png, shoes_6.png, tool_0.png, tool_1.png";*/

// If mm = 7, print size
int mm = 1;

// Navigation
int page = 0;

// Font
PFont regularType;
PFont boldType;

// Background color
int nColor = 0;                      // color variable
color[] palette = new color[2];  // preset colors array

// Images
PImage bg;  // grill, hands, typography
PImage tool;
int nTool = 0;
PImage drink;
int nDrink = 0;
PImage[] shoes = new PImage[7];
PImage[] food = new PImage[10];
int[] nFood = new int[10];

void setup(){
  size(466, 720);
  background(255);
  
  noStroke();
   
  boldType = createFont("bitter_bold.ttf", 14);   
  regularType = createFont("bitter_regular.ttf", 14);
  
  // Background color
  palette[0] = color(0, 255, 180);
  palette[1] = color(137, 26, 255);
  
  // nColor = floor(random(2));
  // nTool = floor(random(2));
  //nDrink = floor(random(6));
  for(int i = 0; i < nFood.length; i ++){
//    nFood[i] = floor(random(10));
    nFood[i] = -1;
  } 
  
  //Images
  bg = loadImage("bg.png");                      // bg  
}

void getVars(){
  for(int i = 0; i < shoes.length; i ++){        // shoes
    shoes[i] = loadImage("shoes_" + i + ".png");
  }
  tool = loadImage("tool_" + nTool + ".png");    // tools
  drink = loadImage("drink_" + nDrink + ".png"); // drinks
  for(int i = 0; i < food.length; i ++){        // food
    food[i] = loadImage("food_" + i + ".png");
  }
}

void drawPoster(){
  background(palette[nColor]);
  
  getVars();
  
  image(bg, 0, 0);
  
//  println(nTool);
//  println(nColor);
  
  // Shoes
  int xShoes = 0;
  int yShoes = 538*mm;
  int nShoes = floor(random(shoes.length));
  image(shoes[nShoes], xShoes, yShoes);
  
  yShoes = 224*mm;
  nShoes = floor(random(shoes.length));
  image(shoes[nShoes], xShoes, yShoes);
  
  yShoes = 38*mm;
  nShoes = floor(random(shoes.length));
  image(shoes[nShoes], xShoes, yShoes);  
  
  xShoes = 370*mm;
  yShoes = 0;
  pushMatrix();
  
    translate(xShoes, yShoes);
    rotate(PI/2);
    
    nShoes = floor(random(shoes.length));
    image(shoes[nShoes], 0, 0);
    
    nShoes = floor(random(shoes.length));
    image(shoes[nShoes], 0, 150*mm);
    
  popMatrix();
  
  xShoes = width;
  yShoes = 674*mm;  
  pushMatrix();
  
    translate(xShoes, yShoes);
    rotate(PI);
    
    nShoes = floor(random(shoes.length));
    image(shoes[nShoes], 0, 0);
    
    nShoes = floor(random(shoes.length));
    image(shoes[nShoes], 0, 338*mm);
    
    nShoes = floor(random(shoes.length));
    image(shoes[nShoes], 0, 510*mm);
    
  popMatrix();
  
  // Food
  int xFood = 85*mm;
  int yFood = 320*mm;
  int maxHeight = 0;
  for(int i = 0; i < food.length; i ++){
    
    if(nFood[i] > 0){
      if(xFood >= 350*mm){
        xFood = 120*mm;
        yFood += maxHeight;
        maxHeight = 0;
      }
  
      image(food[i], xFood, yFood);
      
      xFood += food[i].width;
      if(food[i].height > maxHeight){
        maxHeight = food[i].height; 
      }
    }
  }
  
  // Tools
  image(tool, 93*mm, 487*mm);
  
  // Drinks
  image(drink, 292*mm, 562*mm);
  
  save("picnic_poster.png");
  noLoop();
}

void drawForm1(){
  textAlign(LEFT);
  
  fill(palette[1]);
  textFont(regularType);
  text("Please choose up to 6 of your favourite BBQ food from the list above:",
        50*mm, 100*mm, width - 2*50*mm, 100*mm);
  
  textFont(boldType);
  textLeading(20.2);
  text(" burger \n steak \n sausage \n chicken \n fish \n corn \n bell pepper \n onion \n eggplant \n tomato",
        50*mm, 200*mm);
  
  drawCheck(10);
  drawButton();
}

void drawForm2(){
  textAlign(LEFT);
  
  fill(palette[1]);
  textFont(regularType);
  text("Choose your favorite drink:",
        50*mm, 100*mm, width - 2*50*mm, 100*mm);
  
  textFont(boldType);
  textLeading(20.2);
  text(" beer \n sweet tea \n wine \n lemonade \n soda \n margarita",
        50*mm, 200*mm);
  
  drawCheck(6);      
  drawButton();
}

void drawForm3(){
  textAlign(LEFT);
  
  fill(palette[1]);
  textFont(regularType);
  text("Do you know how to barbecue?",
        50*mm, 100*mm, width - 2*50*mm, 100*mm);
  
  textFont(boldType);
  textLeading(20.2);
  text(" Yes \n No",
        50*mm, 200*mm);
  
  drawCheck(2);      
  drawButton();
}

void drawForm4(){
  textAlign(LEFT);
  
  fill(palette[1]);
  textFont(regularType);
  text("How do you think the weather is going to be next week?",
        50*mm, 100*mm, width - 2*50*mm, 100*mm);
  
  textFont(boldType);
  textLeading(20.2);
  text(" Sunny \n Rainy",
        50*mm, 200*mm);
  
  drawCheck(2);      
  drawButton();
}

void drawCheck(int nCheck){

  int xCheck = 40*mm;
  float yCheck = 190*mm;
  
  for(int  i = 0; i < nCheck; i ++){
    
    noFill();
    stroke(palette[1]);    
    rect(xCheck, yCheck, 10*mm, 10*mm);
    if(page == 0){
      
      for(int j = 0; j < nFood.length; j ++){
        if(nFood[i] > 0){
          noStroke();
          fill(palette[1]);
          rect(xCheck, yCheck, 10*mm, 10*mm);          
        }
      }
      
    }else if(page == 1){

      if(nDrink == i){
        noStroke();
        fill(palette[1]);
        rect(xCheck, yCheck, 10*mm, 10*mm);
      }
      
    }else if(page == 2){

      if(nTool == i){
        noStroke();
        fill(palette[1]);
        rect(xCheck, yCheck, 10*mm, 10*mm);
      }
      
    }else if(page == 3){

      if(nColor == i){
        noStroke();
        fill(palette[1]);
        rect(xCheck, yCheck, 10*mm, 10*mm);
      }
      
    }
    yCheck += 20.2*mm;
  }
}

void drawButton(){
  noStroke();
  fill(palette[1]);
  rect(50*mm, height - 75*mm, 100*mm, 25*mm);
  
  textFont(regularType);
  textAlign(CENTER, CENTER);
  fill(255, 236, 54);
  text("Next", 50*mm, height - 78*mm, 100*mm, 25*mm);
}

void mouseReleased(){
  if(50*mm <= mouseX && mouseX <= 150*mm &&
     height - 75*mm <= mouseY && mouseY <= height - 50*mm){
    page ++;
  }
  
  float yCheck = 190*mm;
 
  if(page == 0){
    for(int j = 0; j < nFood.length; j ++){    
      if(yCheck <= mouseY && mouseY <= yCheck + 10*mm){
        nFood[j] = - nFood[j];
      }
      yCheck += 20.2*mm;
    }
    
  }else if(page == 1){
    for(int  i = 0; i < 6; i ++){
      if(yCheck <= mouseY && mouseY <= yCheck + 10*mm){
        nDrink = i;
      }
      yCheck += 20.2*mm;
    }  
    
  }else if(page == 2){
    for(int  i = 0; i < 2; i ++){
      if(yCheck <= mouseY && mouseY <= yCheck + 10*mm){
        nTool = i;
      }
      yCheck += 20.2*mm;
    }
    
  }else if(page == 3){
    for(int  i = 0; i < 2; i ++){
      if(yCheck <= mouseY && mouseY <= yCheck + 10*mm){
        nColor = i;
      }
      yCheck += 20.2*mm; 
    } 
  }
}

void draw(){
  background(255, 236, 54);

  if(page == 0){
    drawForm1();
  }else if(page == 1){
    drawForm2();
  }else if(page == 2){
    drawForm3();
  }else if(page == 3){
    drawForm4();
  }else{
    drawPoster();
  }
}


