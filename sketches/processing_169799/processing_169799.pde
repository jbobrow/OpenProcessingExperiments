
//UI INDIVIDUAL RESEARCH PROTOTYPE
//By Bren McNamara                                                                     
// ----
//Beware, this code is haunted!!!! boo!!!
//
//
//Sources: 
//
//On/Off toggle
//http://stackoverflow.com/questions/6406595/on-off-button-for-processing


TopBar topBar;
ItemMenu itemMenu;
FoodMenu foodMenu;
color backgroundColor;

void setup() {
  size(400, 400);  
  topBar = new TopBar();
  itemMenu = new ItemMenu();
  foodMenu = new FoodMenu();
  backgroundColor = color(50);

}

void draw() {
  background(backgroundColor);
  topBar.display();
  topBar.option1();
  topBar.menuActions();
}

void mousePressed() {
  topBar.mousePressed();
  itemMenu.mousePressed();
  foodMenu.mousePressed();
  
}
class FoodMenu {
  PVector position, offset;
  boolean mouseOverBar; //Is mouse over the drag bar?
  boolean dragged;  //Is the window being dragged?
  boolean overX;

  FoodMenu() {
    position = new PVector(60, height/2+15);
    offset = new PVector();
  } //contructor end

  void drawMenu() {
    dragMenu();
    println("drawing menu");
    //FOOD MENU TOP BAR
    fill(0);
    stroke(255);
    rect(position.x, position.y, 100, 20);
    String menutitle = "FOODZ";
    fill(255);
    text(menutitle, position.x+3, position.y+2, 100, 20);
    //FOOD MENU BODY
    fill(150);
    rect(position.x, position.y+20, 100, 100);
    rect(position.x+2, position.y+20, 96, 98);
  } //end drawMenu()

  void dragMenu() { //Drags
    //If mouse is over menu...
    if (mouseX >= position.x && mouseY >= position.y && mouseX <= position.x+100 && mouseY <= position.y+20) {
      mouseOverBar = true;
    } else {
      mouseOverBar = false;
    }

    //... drag it with offset.
    if (dragged == true) {
      position.x = mouseX + offset.x; 
      position.y = mouseY + offset.y;
    }
    //If mouse is released, stop dragging.
    if (mousePressed == false) {
      dragged = false;
    }
  } //end dragMenu()  
  void mousePressed() {
    if (mouseOverBar == true) {
      dragged = true;
      offset.x = position.x - mouseX;  //Record offset
      offset.y = position.y - mouseY;
    }
  }
} //class end

class ItemMenu {
  PVector position, offset;
  boolean mouseOverBar; //Is mouse over the drag bar?
  boolean dragged;  //Is the window being dragged?
  boolean overX;

  ItemMenu() {
    position = new PVector(30, height/2);
    offset = new PVector();
  } //contructor end

  void drawMenu() {
    dragMenu();

    println("drawing menu");
    //ITEM MENU TOP BAR
    fill(0);
    stroke(255);
    rect(position.x, position.y, 100, 20);
    String menutitle = "ITEMS";
    fill(255);
    text(menutitle, position.x+3, position.y+2, 100, 20);
    //ITEM MENU BODY
    fill(150);
    rect(position.x, position.y+20, 100, 100);
    rect(position.x+2, position.y+20, 96, 98);
  } //end drawMenu()

  void dragMenu() { //Drags
    //If mouse is over menu...
    if (mouseX >= position.x && mouseY >= position.y && mouseX <= position.x+100 && mouseY <= position.y+20) {
      mouseOverBar = true;
    } else {
      mouseOverBar = false;
    }
    //... drag it with offset.
    if (dragged == true) {
      position.x = mouseX + offset.x; 
      position.y = mouseY + offset.y;
    }
    //If mouse is released, stop dragging.
    if (mousePressed == false) {
      dragged = false;
    }
  } //end dragMenu()  
  void mousePressed() {
    if (mouseOverBar == true) {
      dragged = true;
      offset.x = position.x - mouseX;  //Record offset
      offset.y = position.y - mouseY;
    }
  }
} //class end

class TopBar {
  color option1Color;
  boolean mouseOver1; //Is mouse over view menu?
  boolean open1; //Is view menu open?
  boolean overOp1, overOp2, overOp3, overOp4; //Mouse over Option1, 2, ...?
  boolean showItemMenu, showFoodMenu; //Is item menu being shown?  
  PImage spooky;

  //CONSTRUCTOR
  TopBar() {
    option1Color = color(0);
    open1 = false;
    overOp1 = false;
    overOp2 = false;
    overOp3 = false;
    overOp4 = false;
    showItemMenu = false;
    showFoodMenu = false;
    spooky = loadImage("spooky.png");
    spooky.resize(width, height);
  } //contructor end

  void display() {
    //MAIN BAR
    fill(0);
    stroke(255);
    strokeWeight(1);
    rect(0, 0, width-1, 20);
  } //end top display

  //VIEW OPTION 
  void option1() {
    fill(option1Color);
    stroke(255);
    strokeWeight(1);
    rect(0, 0, 50, 20);  
    String words = "VIEW";
    fill(255);
    text(words, 4, 3, 50, 18);

    //IS MOUSE OVER VIEW OPTION?
    if (mouseY >= 0 && mouseX >= 0 && mouseX <= 50 && mouseY <= 20) {
      mouseOver1 = true;
    } else {
      mouseOver1 = false;
    } //else
    if (mouseOver1 == true) {
      option1Color = color(125);
    } else {
      option1Color = color(0);
    } //else

    //OPEN MENU
    if (open1 == true) {
      drawViewMenu();
    }
  } //end option1
  //DRAW OPEN MENU
  void drawViewMenu() {
    stroke(255);
    fill(0);
    rect(0, 20, 100, 80); //outer box
    drawMenuOption1();
    drawMenuOption2();
    drawMenuOption3();
    drawMenuOption4();
  } //end drawMenu

  //MENU ACTIONS
  void menuActions() {
    if (showItemMenu == true) {
      itemMenu.drawMenu();
    }
    if (showItemMenu == false) {
    }
    if (showFoodMenu == true) {
      foodMenu.drawMenu();
      println("showing food menu");
    }
  } //end menuActions


  //MENU OPTION 1
  void drawMenuOption1() {    
    fill(0);
    if (mouseX > 0 && mouseY > 20 && mouseX < 100 && mouseY < 40) {
      overOp1 = true;
      fill(130);
    } else {
      overOp1 = false;
    }
    rect(0, 20, 100, 20); //option1
    String words1 = "TOGGLE ITEMS";
    fill(255);
    text(words1, 4, 23, 100, 18);
  }

  //MENU OPTION 2
  void drawMenuOption2() {
    fill(0);
    if (mouseX > 0 && mouseY > 40 && mouseX < 100 && mouseY < 60) {
      overOp2 = true;
      fill(130);
    } else {
      overOp2 = false;
    }
    rect(0, 40, 100, 20); //option2
    String words2 = "TOGGLE FOOD";
    fill(255);
    text(words2, 4, 43, 100, 18);
  }

  //MENU OPTION 3
  void drawMenuOption3() {
    fill(0);
    if (mouseX > 0 && mouseY > 60 && mouseX < 100 && mouseY < 80) {
      overOp3 = true;
      fill(130);
    } else {
      overOp3 = false;
    }
    rect(0, 60, 100, 20); //option3
    String words3 = "CHANGE BG";
    fill(255);
    text(words3, 4, 63, 100, 18);
  }

  //MENU OPTION 4
  void drawMenuOption4() {
    fill(0);
    if (mouseX > 0 && mouseY > 80 && mouseX < 100 && mouseY < 100) {
      overOp4 = true;
      fill(130);
    } else {
      overOp4 = false;
    }
    rect(0, 80, 100, 20); //option4
    String words4 = "h̵̴̸̡̛e͠͞͠l̷̛̀p̡͜͞ ̛̛͢m̷̸̡͜͠ȩ̨͟͠";
    fill(255);
    text(words4, 4, 83, 100, 18);
  }


  //IF VIEW CLICKED - TOGGLE OPEN/CLOSE
  void mousePressed() {
    if (mouseOver1 == true) {
      open1 = !open1;
    }
    //IF OPTION 1 CLICKED - EXECUTE OPTION 1 
    if (overOp1 == true) {
      executeOp1();
    }

    //IF OPTION 2 CLICKED - EXECUTE OPTION 2 
    if (overOp2 == true) {
      executeOp2();
    }

    //IF OPTION 3 CLICKED - EXECUTE OPTION 3 
    if (overOp3 == true) {
      executeOp3();
    }

    //IF OPTION 4 CLICKED - EXECUTE OPTION 4 
    if (overOp4 == true) {
      executeOp4();
    }
  }//mousePressed()
  void executeOp1() { //runs only when overOp1 == true
    println("executing option 1");    
    showItemMenu = !showItemMenu; //see MENU ACTIONS above
  }

  void executeOp2() { //runs only when overOp2 == true
    showFoodMenu = !showFoodMenu;
    println("executing option 2");
  }

  void executeOp3() { //runs only when overOp3 == true
    println("executing option 3");
    backgroundColor = color(random(155), random(155), random(155));
  }

  void executeOp4() { //runs only when overOp4 == true   
    image(spooky, 0, 0);
    println("im trapped");
  }
} //class end



