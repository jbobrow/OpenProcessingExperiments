
//New York at Night photograph by Paulo Barcellos Jr.
//Image license: http://creativecommons.org/licenses/by-sa/2.0/
//Image source:  http://commons.wikimedia.org/wiki/File:New_York_City_at_night_HDR.jpg

PFont  GFont;
PImage GBaseImage;
PImage GSrcImage;
PImage GDstImage;
PImage GGaussianImage;
int    GNumPixels;
int    GFilterType = 0; //0 = None, 1 = Bokeh, 2 = Gaussian.
int    GNumPasses  = 4;
int    GKernelSize = 3;
int[]  GStrides;

boolean BLUR_DARK_REGIONS = true;


void setup()
{
    GFont      = loadFont("GillSans-16.vlw");
    GBaseImage = loadImage("NewYork.jpg");
    GSrcImage  = createImage(GBaseImage.width, GBaseImage.height, RGB);
    GDstImage  = createImage(GBaseImage.width, GBaseImage.height, RGB);
    GDstImage.copy(GBaseImage, 0, 0, GBaseImage.width, GBaseImage.height,
                               0, 0, GBaseImage.width, GBaseImage.height);
    GNumPixels = GBaseImage.width*GBaseImage.height;
    GStrides    = new int[4];
    GStrides[0] = GBaseImage.width+1;    /*    \ Diagonal     */
    GStrides[1] = GBaseImage.width-1;    /*    / Diagonal     */
    GStrides[2] = 1;                     /*    - Horizontal   */
    GStrides[3] = GBaseImage.width;      /*    | Vertical     */
    size(GBaseImage.width, GBaseImage.height);
    frameRate(10);
    textFont(GFont, 16);
    fill(255.0);
    
    GGaussianImage = createImage(GBaseImage.width, GBaseImage.height, RGB);
    GGaussianImage.copy(GBaseImage, 0, 0, GBaseImage.width, GBaseImage.height,
                                    0, 0, GBaseImage.width, GBaseImage.height);
    GGaussianImage.filter(BLUR, 4);
    FilterImage();
}

void draw()
{
    image(GDstImage, 0, 0);
    String [] filterNames = { "  None   ", "  Bokeh  ", "Gaussian" };
    int x = 30;
    int y = 30;
    text("Controls", x,  y);
    text("--------------", x,  y+10);
    text("\'T\'       Filter type               [ " + filterNames[GFilterType] + " ]", x,  y+30);
    
    if (GFilterType == 1) // Bokeh
    {
        text("\'1\'-\'9\'   Kernel size             [       " + GKernelSize + "        ]", x,  y+50);
        text("\'P\'        Number of passes  [       " + GNumPasses + "        ]", x, y+70);
    }
}

void FilterImage()
{
    if (GFilterType == 0)
    {
        GDstImage.copy(GBaseImage, 0, 0, GBaseImage.width, GBaseImage.height,
                                   0, 0, GBaseImage.width, GBaseImage.height);
    }
    else if (GFilterType == 1)
    {
        BokehFilterImage();
    }
    else
    {
        //Gaussian filter image
        GDstImage.copy(GBaseImage, 0, 0, GBaseImage.width, GBaseImage.height,
                                   0, 0, GBaseImage.width, GBaseImage.height);
        GDstImage.filter(BLUR, GKernelSize);
    }
}

void BokehFilterImage()
{
    GSrcImage.copy(GBaseImage, 0, 0, GBaseImage.width, GBaseImage.height,
                               0, 0, GBaseImage.width, GBaseImage.height);
                                 
    for (int stride_id = 0 ; stride_id<GNumPasses ; ++stride_id)
    {
        GSrcImage.loadPixels();
        GGaussianImage.loadPixels();
        for (int index=0 ; index<GNumPixels; ++index)
        {
            GDstImage.pixels[index] = BokehFilterPixel(index, GStrides[stride_id]);
        }
        GDstImage.updatePixels();
        GSrcImage.copy(GDstImage, 0, 0, GBaseImage.width, GBaseImage.height,
                                  0, 0, GBaseImage.width, GBaseImage.height);
    }
}

color BokehFilterPixel(int pixelOffset, int stride)
{
    int start_index = pixelOffset - stride * ((GKernelSize-1) / 2);
    int end_index   = pixelOffset + stride * ( GKernelSize    / 2);
    int max_colour  = 0;
    
    for (int id=start_index ; id<=end_index ; id+=stride)
    {
        int index = constrain(id, 0, (GBaseImage.width*GBaseImage.height)-1);
        color pixel = GSrcImage.pixels[index];
        if (Luminosity(pixel) > Luminosity(max_colour))
        {
            max_colour = pixel;
        }
    }
    
    if (BLUR_DARK_REGIONS && Luminosity(max_colour) < 0.4)
    {
        return lerpColor(GGaussianImage.pixels[pixelOffset], max_colour, Luminosity(max_colour)*2.5);
    }
    
    return max_colour;
}


float Luminosity(color c)
{
    float r = (float) red(c)   / 255.0;
    float g = (float) green(c) / 255.0;
    float b = (float) blue(c)  / 255.0;
    r *= 0.299;
    g *= 0.587;
    b *= 0.114;
    return r + g + b;
}

void keyPressed()
{
    int numeric_value = Character.getNumericValue(key);
    
    if (numeric_value >= 1 && numeric_value <= 9)
    {
        GKernelSize = numeric_value;
    }
    else if (key == 'p')
    {
        GNumPasses = ((GNumPasses - 1) % 3) + 2;
    }
    else if (key == 't')
    {
        GFilterType = (GFilterType+1) % 3;
    }
    else
    {
        return;
    }
    
    FilterImage();
}


