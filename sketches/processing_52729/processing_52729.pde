
int c_pos_x, c_pos_y, c_size, c_hue;

void setup()
{
    colorMode(HSB);
    size(350,350);
    background(127);
    frameRate(100);
    smooth();
    c_pos_x = c_pos_y = 175, c_size = 20, c_hue = 0;
}

void draw()
{
    background(127);
    fill(0,0,0,0);
    rectMode(CENTER);
    rect(175,175,100,100);
    c_hue++;
    if(c_hue > 255)
    {
        c_hue = 0;
    }
    fill(c_hue,255,255);
    stroke(255);
    ellipse(c_pos_x,c_pos_y,c_size,c_size);
    if(mouseX <= c_pos_x)
    {
        if(c_pos_x >= 136)
            {
                c_pos_x--;
            }
        }
        if(mouseX >= c_pos_x)
        {
            if(c_pos_x <= 214)
            {
                c_pos_x++;
            }
        }
        if(mouseY <= c_pos_y)
        {
            if(c_pos_y >= 136)
            {
                c_pos_y--;
            }
        }
        if(mouseY >= c_pos_y)
        {
            if(c_pos_y <= 214)
            {
                c_pos_y++;
            }
        }
}

void keyPressed()
{
    setup();
}
