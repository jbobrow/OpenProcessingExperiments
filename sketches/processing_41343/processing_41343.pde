
static final int   GNumPoints        = 4;
static final float GThreshold        = 0.0003f;
static final float GPerlinStepSize   = 0.02f;
static final float GPerlinScale      = 60.0f;
static final float GReflectedPower   = 11000.0f;
static final int   GReflectedColour  = 0xDDEEFF;
static final float GReflectedMinimum = 16.0f;
static final float GReflectedScale   = 80.0f;
static PImage      GImage;
static PVector[]   GPoints;

void setup()
{
    GImage  = loadImage("SandDunes.jpg");
    size(GImage.width, GImage.height);
    //size(800, 500, P2D); // For Processing 2.0

    GPoints  = new PVector[GNumPoints];
    
    for (int i=0 ; i<GNumPoints ; ++i)
    {
        GPoints[i] = new PVector();
    }
}

void draw()
{
    image(GImage, 0, 0);
    
    GPoints[0].set(mouseX,       mouseY,        0.0f);
    GPoints[1].set(width-mouseX, mouseY,        0.0f);
    GPoints[2].set(mouseX,       height-mouseY, 0.0f);
    GPoints[3].set(width-mouseX, height-mouseY, 0.0f);
    
    PVector offset       = new PVector();
    PVector pixel_coords = new PVector();
    int     refracted_x;
    int     refracted_y;
    int     refracted_index;
    float   depth;
    
    for (int y=0 ; y<height ; ++y)
    {
        beginShape(POINTS);
        
        for (int x=0 ; x<width ; ++x)
        {
            float density = 0.0f;
            pixel_coords.set(x, y, 0.0f);
            for (int i=0 ; i<GNumPoints ; ++i)
            {
                offset.set(GPoints[i]);
                offset.sub(pixel_coords);
                density += 1.0f / offset.dot(offset); //Length squared
            }
            
            if (density>GThreshold)
            {
                float perlin = GPerlinScale * (noise((mouseX+x)*GPerlinStepSize,
                                                     (mouseY+y)*GPerlinStepSize)-0.5f);
                offset.set(perlin, perlin, 0.0f);
              
                refracted_x = x + (int)offset.x;
                refracted_y = y + (int)offset.y;
                refracted_x = refracted_x<0          ? 0        : refracted_x;
                refracted_y = refracted_y<0          ? 0        : refracted_y;
                refracted_x = refracted_x>(width-1)  ? width-1  : refracted_x;
                refracted_y = refracted_y>(height-1) ? height-1 : refracted_y;
                
                refracted_index = refracted_y * width + refracted_x;

                float reflected = 1.0f - (density - GThreshold);
                reflected = pow(reflected, GReflectedPower);
                int reflected_amount = (int)(GReflectedMinimum+reflected*GReflectedScale) << 24;
                
                color final_colour = blendColor(GImage.pixels[refracted_index],
                                                GReflectedColour + reflected_amount,
                                                BLEND);
                stroke(final_colour);
                vertex(x, y);
            }
        }
        
        endShape();
    }
}

