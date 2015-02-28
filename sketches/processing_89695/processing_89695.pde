
float G_x ;
float G_y ;
boolean GDraw;
boolean GMoveLeft;
boolean GMoveRight;
boolean GMoveStop;

float N_x;
float N_y;
boolean NDraw;
boolean NMoveLeft;
boolean NMoveRight;
boolean NMoveStop;

float SecondI_x;
float SecondI_y;
boolean SecondIDraw;
boolean SecondIMoveRight;
boolean SecondIMoveLeft;
boolean SecondIMoveStop;

float M_x;
float M_y;
boolean MDraw;
boolean MMoveRight;
boolean MMoveLeft;
boolean MMoveStop;

float FirstI_x;
float FirstI_y;
boolean FirstIDraw;
boolean FirstIMoveRight;
boolean FirstIMoveLeft;
boolean FirstIMoveStop;


float T_x;
float T_y;
boolean TDraw;
boolean TMoveRight;
boolean TMoveLeft;
boolean TMoveStop;

float moveSpeed;

int fillColor;

PFont text1;
int size1=40;


void setup()
{
  size(600, 600);
  background(0);

  G_x = 300 - 55;
  G_y = 600 - 10;
  N_x = 300 - 35;
  N_y = 600 - 110;
  SecondI_x = 300 - 35;
  SecondI_y = 600 - 210;
  M_x = 300 - 35;
  M_y = 600 - 310;
  FirstI_x = 300 - 35;
  FirstI_y = 600 - 410;
  T_x = 300 - 35;
  T_y = 600 - 510;

  GDraw = true;
  GMoveLeft = true;
  GMoveRight = false;
  GMoveStop = false;

  NDraw = false;
  NMoveLeft = true;
  NMoveRight = false;
  NMoveStop = false;
  
  SecondIDraw = false;
  SecondIMoveLeft = true;
  SecondIMoveRight = false;
  SecondIMoveStop = false;
  
  MDraw = false;
  MMoveLeft = true;
  MMoveRight = false;
  MMoveStop = false;
  
  FirstIDraw = false;
  FirstIMoveLeft = true;
  FirstIMoveRight = false;
  FirstIMoveStop = false;
  
  TDraw = false;
  
  fillColor = 0;

  text1= createFont("SegoeUI-Bold-100.vlw");
  textFont(text1);
}

void reset() {

  print("END YO");

  G_x = 300 - 55;
  G_y = 600 - 10;
  N_x = 300 - 35;
  N_y = 600 - 110;
  SecondI_x = 300 - 35;
  SecondI_y = 600 - 210;
  M_x = 300 - 35;
  M_y = 600 - 310;
  FirstI_x = 300 - 35;
  FirstI_y = 600 - 410;
  T_x = 300 - 35;
  T_y = 600 - 510;

   GDraw = true;
  GMoveLeft = true;
  GMoveRight = false;
  GMoveStop = false;

  NDraw = false;
  NMoveLeft = true;
  NMoveRight = false;
  NMoveStop = false;
  
  SecondIDraw = false;
  SecondIMoveLeft = true;
  SecondIMoveRight = false;
  SecondIMoveStop = false;
  
  MDraw = false;
  MMoveLeft = true;
  MMoveRight = false;
  MMoveStop = false;
  
  FirstIDraw = false;
  FirstIMoveLeft = true;
  FirstIMoveRight = false;
  FirstIMoveStop = false;
  
  TDraw = false;
  TMoveLeft = true;
  TMoveRight = false;
  TMoveStop = false;
}

void keyReleased() {
  if (!GMoveStop) {
    NDraw = true;
    NMoveLeft = true;
    GMoveStop = true;
  }

  else if (!NMoveStop) {
    println("called");
    SecondIDraw = true;
    SecondIMoveLeft = true;
    NMoveStop = true;
  }

  else if (!SecondIMoveStop) {

    MDraw = true;
    MMoveLeft = true;
    SecondIMoveStop = true;
  }

  else if (!MMoveStop) {
      
    FirstIDraw = true;
    FirstIMoveLeft = true;
    MMoveStop = true;  
    
  }

  else if (!FirstIMoveStop) {
    
     TDraw = true;
     FirstIMoveStop = true;
    
  }

}


void draw()
{


  background(0);

  //platform
  fill(0, 0, 200, 80);
  rect(245, height - 10, 100, 10);


  if (GDraw == true) {

    stroke(0);
    fill(255, 42);
    rect(G_x, G_y-100, 100, 100);

    fill(0);
    stroke(0, 255, 45, 45);
    // translate(mouseX, mouseY);
    text("G", G_x+10, G_y-10);

    if (!GMoveStop) {
      if (GMoveLeft) {
        if (G_x > 0) {
          G_x -= 1;
        }
        else {
          GMoveRight = true;
          GMoveLeft = false;
        }
      }

      if (GMoveRight) {
        if (G_x < width - 100) {
          G_x += 1;
        }
        else {
          GMoveRight = false;
          GMoveLeft = true;
        }
      }
    }
    else if (G_x < 200 || G_x > 350) {
      reset();
    }
  }

  if (NDraw == true) {
    stroke(0);
    fill(255, 42);
    rect(N_x, N_y-100, 100, 100);

    fill(0);
    stroke(0, 255, 45, 45);
    // translate(mouseX, mouseY);
    text("N", N_x+10, N_y-10);

    if (!NMoveStop) {
      if (NMoveLeft) {
        if (N_x > 0) {
          N_x -= 2;
        }
        else {
          NMoveRight = true;
          NMoveLeft = false;
        }
      }

      if (NMoveRight) {
        if (G_x < width - 100) {
          N_x += 2;
        }
        else {
          NMoveRight = false;
          NMoveLeft = true;
        }
      }
    }
    else if (N_x < G_x-50 || N_x > G_x+75) {
      print("resetCalled");
      reset();
    }
  }

  if (SecondIDraw == true) {
    stroke(0);
    fill(255, 42);
    rect(SecondI_x, SecondI_y-100, 100, 100);

    fill(255, 42);
    stroke(0, 255, 45, 45);
    // translate(mouseX, mouseY);
    text("I", SecondI_x+32, SecondI_y-15);

    if (!SecondIMoveStop) {
      if (SecondIMoveLeft) {
        if (SecondI_x > 0) {
          SecondI_x -= 4;
        }
        else {
          SecondIMoveRight = true;
          SecondIMoveLeft = false;
        }
      }

      if (SecondIMoveRight) {
        if (SecondI_x < width - 100) {
          SecondI_x += 4;
        }
        else {
          SecondIMoveRight = false;
          SecondIMoveLeft = true;
        }
      }
    }
    else if (SecondI_x < N_x-50 || SecondI_x > N_x+75) {
      print("resetCalled");
      reset();
    }
  }

  if (MDraw == true) { 
    stroke(0);
    fill(255, 42);
    rect(M_x, M_y-100, 100, 100);

    fill(255, 42);
    stroke(0, 255, 45, 45);
    // translate(mouseX, mouseY);
    text("M", M_x+3, M_y-10);

    if (!MMoveStop) {
      if (MMoveLeft) {
        if (M_x > 0) {
          M_x -= 8;
        }
        else {
          MMoveRight = true;
          MMoveLeft = false;
        }
      }

      if (MMoveRight) {
        if (M_x < width - 100) {
          M_x += 8;
        }
        else {
          MMoveRight = false;
          MMoveLeft = true;
        }
      }
    }
    else if (M_x < SecondI_x-50 || M_x > SecondI_x +75) {
      print("resetCalled");
      reset();
    }
  }

  if (FirstIDraw == true) {
    stroke(0);
    fill(255, 42);
    rect(FirstI_x, FirstI_y-100, 100, 100);

    fill(255, 42);
    stroke(0, 255, 45, 45);
    // translate(mouseX, mouseY);
    text("I", FirstI_x+32, FirstI_y-15);

    if (!FirstIMoveStop) {
      if (FirstIMoveLeft) {
        if (FirstI_x > 0) {
          FirstI_x -= 16;
        }
        else {
          FirstIMoveRight = true;
          FirstIMoveLeft = false;
        }
      }

      if (FirstIMoveRight) {
        if (FirstI_x < width - 100) {
          FirstI_x += 16;
        }
        else {
          FirstIMoveRight = false;
          FirstIMoveLeft = true;
        }
      }
    }
    else if (FirstI_x < M_x-50 || FirstI_x > M_x+75) {
      print("resetCalled");
      reset();
    }
    
  }

  if (TDraw == true) {
    stroke(0);
    fill(255, 42);
    rect(T_x, T_y-100, 100, 100);    

    fill(255, 42);
    stroke(0, 255, 45, 45);
    // translate(mouseX, mouseY);
    text("T", T_x+18, T_y-10);

   if (!TMoveStop) {
      if (TMoveLeft) {
        if (T_x > 0) {
          T_x -= 8;
        }
        else {
          TMoveRight = true;
          TMoveLeft = false;
        }
      }

      if (TMoveRight) {
        if (T_x < width - 100) {
          T_x += 8;
        }
        else {
          TMoveRight = false;
          TMoveLeft = true;
        }
      }
    }
    else if (T_x < FirstI_x-50 || T_x > FirstI_x+75) {
      print("resetCalled");
      reset();
    }
  }
}


