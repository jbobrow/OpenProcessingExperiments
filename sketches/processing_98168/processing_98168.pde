
final int WIDTH = 200;
final int HEIGHT = WIDTH;

int SIDES = 8;
int cellWidth = WIDTH/SIDES;
int cellHeight = cellWidth;

int i = 0; //filled index column
int j = 0; //filled index row
float x = 0;
float y = 0;
int m_x = 0;
int m_y = 0;

void setup()
{
      size(WIDTH,HEIGHT);
}

void mousePressed() {

     clearAll();

     drawgrid();

     fillCell();
     
}



void mouseReleased() {

    //randomSeed(mouseX*mouseY*millis());

    m_x=floor(mouseX/cellWidth);
    m_y=floor(mouseY/cellHeight);

    println(m_x);
    println(m_y);

}



void draw(){

    noFill();

        drawgrid();

          fillCell();

            fildest();

}



void drawgrid() {

for (x=0; x<WIDTH; x+=cellHeight)

    for (y=0; y<WIDTH; y+=cellWidth)

        rect(x,y,cellWidth,cellHeight);

}



void fillCell() {

    fill(0,0,255);

      rect(i,j,cellWidth,cellHeight);

}





void clearAll() {

    fill(255,255,255);

    rect(0,0,WIDTH,HEIGHT);

}





void fildest() {

    int base_x = floor(i/cellWidth);
    int base_y = floor(j/cellHeight);

    int m_x_orig = m_x;
    int m_y_orig = m_y;

    println(base_x);
    println(base_y);

    int diff_x = m_x - base_x;
    int diff_y = m_y - base_y;

   
    println(diff_x);
    println(diff_y);


    while (diff_x > 0) {
    
        base_x++;
        diff_x--;
        fill(random(256),random(255),random(255));
        rect(base_x*cellWidth,j,cellWidth,cellHeight);
        
    }

    

    println(diff_x);

    while (diff_x < 0) {

        m_x++;
        diff_x++;
        fill(random(256),random(255),random(255));
        rect(m_x*cellWidth,j,cellWidth,cellHeight);

    }

    

    println(diff_x);

    fill(random(255),random(255),random(255));
    rect(m_x_orig*cellWidth, j, cellWidth, cellHeight);

    while (diff_y > 0) {

        base_y++;
        diff_y--;
        fill(random(256),random(255),random(255));
        rect(m_x_orig*cellWidth,base_y*cellHeight,cellWidth,cellHeight);

    }

    

    println(diff_y);

    while (diff_y < 0) {

        m_y++;
        diff_y++;
        fill(random(256),random(255),random(255));
        rect(m_x_orig*cellWidth,m_y*cellHeight,cellWidth,cellHeight);

    }

    

    println(diff_y);
    fill(0,255,0);
    rect(m_x_orig*cellWidth, m_y_orig*cellHeight, cellWidth, cellHeight);

}







void keyPressed()

{

    clearAll();
    drawgrid();

  if (key == CODED) {

    if ((keyCode == UP) && (j>= cellHeight)) {
       j -= cellHeight;
       fill(0,0,255);
       rect(i,j,cellWidth,cellHeight);
    }

    else if ((keyCode == DOWN) && (j < HEIGHT - cellHeight)) {
       j += cellHeight;
       fill(0,0,255);
       rect(i,j,cellWidth,cellHeight);
    }

    else if ((keyCode == RIGHT) && (i < WIDTH - cellWidth)) {
       i += cellWidth;
       fill(0,0,255);
       rect(i,j,cellWidth,cellHeight);
    }

    else if ((keyCode == LEFT) && (i >= cellWidth)) {
        i -= cellWidth;
        fill(0,0,255);
        rect(i,j,cellWidth,cellHeight);
     }

  }

}
