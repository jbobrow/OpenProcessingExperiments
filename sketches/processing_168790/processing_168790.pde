
//NewArt.pde

color[] arctic = {#59A5BF, #3B6E7F, #76DCFF, #1E3740, #6AC6E5}; 
color[] reddish = {#7F000E, #FF4C60, #FF001C, #7F2630, #CC0017};
color[] lovely = {#5E0069, #611F69, #D100E8, #DC47EC, #A300B5};

color pallete = arctic;

int counter = 0;
int counterMax = 300;

void setup()
{
    size(screen.height, screen.width);
    background(pallete[0]);


}

void draw()
{
    while(counter < counterMax)
    {
        //stroke color
        stroke(pallete[int(random(1, pallete.length))]);
        strokeWeight(random(1, 15));

        fill(pallete[int(random(1, pallete.length))]);

        //ellipses
        float x = random(screen.height);
        float y = random(screen.width);

        float theWidth = random(3, 30);
        
        ellipse(x, y, theWidth, theWidth);

        //prepare square
        stroke(pallete[int(random(1, pallete.length))]);
        strokeWeight(random(2, 10));

        noFill();

        x = random(screen.height);
        y = random(screen.width);

        float theHeight = random(3, 35);

        rect(x, y, theWidth, theHeight);
        
        
        counter++;
    }

    if(mousePressed)
    {
        int temp = int(random(1, 4));

        switch(temp)
        {
            case 1:
                pallete = arctic;
                break;
            case 2:
                pallete = reddish;
                break;
            case 3:
                pallete = lovely;
                break;

        }
        background(pallete[0]);
        counter = 0;
    }
}











    





    
