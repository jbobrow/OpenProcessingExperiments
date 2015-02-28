
int WIDTH = 800;
int HEIGHT = 600;

int number = 100;

int[][] bx = new int[number][2];
int[][] by = new int[number][2];

int[] dx = new int[number];
int[] dy = new int[number];

color[] c = new color[number];

int fr = 40;

void setup()
{
    size(800,600);
    background(0);
    strokeWeight(3);
    
    for (int i = 0; i < number; i++)
    {
        bx[i][0] = WIDTH/2;
        by[i][0] = HEIGHT/2;
        bx[i][1] = WIDTH/2;
        by[i][1] = HEIGHT/2;
        
        c[i] = color(random(255),random(255),random(255));
    
        dx[i] = floor(random(10) - 5);
        dy[i] = floor(random(10) - 5);
    }
}

void draw()
{
    frameRate(fr);
    fill(0,40);
    noStroke();
    rect(-10,-10,WIDTH+10,HEIGHT+10);
    
    for (int i = 0; i < number; i++)
    {
        bx[i][0] = bx[i][1];
        by[i][0] = by[i][1];
        
        bx[i][1] += dx[i];
        by[i][1] += dy[i];
        
        if (bx[i][1] > WIDTH || bx[i][1] < 0)
        {
            dx[i] = -dx[i];
        }
        else if (by[i][1] > HEIGHT || by[i][1] < 0)
        {
            dy[i] = -dy[i];
        }
        else
        {
            dx[i] += floor(random(11) - 5);
            dy[i] += floor(random(11) - 5);
            
            if (dx[i] > 20)
            {
                dx[i] = 20;
            }
            if (dy[i] > 20)
            {
                dy[i] = 20;
            }
            if (dx[i] < -20)
            {
                dx[i] = -20;
            }
            if (dy[i] < -20)
            {
                dy[i] = -20;
            }
        }
        
        for (int j = 0; j < number; j++)
        {
            if (j == i)
            {
                continue;
            }
            else if (bx[i][1] == bx[j][1] && by[i][1] == by[j][1])
            {
                dx[j] = -dx[j];
                dy[j] = -dy[j];
                dx[i] = -dx[i];
                dy[i] = -dy[i];
                
                fill(255,0,0);
                noStroke();
                ellipse(bx[i][1],by[i][1],100,100);
                fr = 10;
            }
        }
        
        stroke(c[i]);
        line(bx[i][0],by[i][0],bx[i][1],by[i][1]);
    }
    
    fr += 1;
    
    if (fr > 40)
    {
        fr = 40;
    }
}
