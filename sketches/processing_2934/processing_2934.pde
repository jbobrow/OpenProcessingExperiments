
float[][] GSummedAreaTable;
PImage    GBlurredImage;

void setup()
{
    frameRate(30);
    PImage img = loadImage("Harvard.jpg");
    
    size(img.width, img.height);
    image(img, 0, 0);
    
    GBlurredImage = createImage(img.width, img.height, RGB);
    GSummedAreaTable = new float[img.width][img.height];
    
    float line_sum = 0.0f;

    //Top row
    for (int x=0 ; x<img.width ; ++x)
    {
        line_sum += red(img.pixels[x]);
        GSummedAreaTable[x][0] = line_sum;
    }

    //Fill in the rest of the table
    for (int y=1 ; y<img.height ; ++y)
    {
        line_sum = 0.0f;
        for (int x=0 ; x<img.width ; ++x)
        {
            line_sum += red(img.pixels[y*img.width + x]);
            GSummedAreaTable[x][y] = line_sum;
            GSummedAreaTable[x][y] += GSummedAreaTable[x][y-1];
        }
    }
}

void draw()
{
    int kernel_size = max(mouseX / 10, 1);
 
    GBlurredImage.loadPixels();   
    for (int y_max=0 ; y_max<GBlurredImage.height ; ++y_max)
    {
        for (int x_max=0 ; x_max<GBlurredImage.width; ++x_max)
        {
            int x_kernel_size = min(x_max, kernel_size);
            int y_kernel_size = min(y_max, kernel_size);
            int x_min = x_max-x_kernel_size;
            int y_min = y_max-y_kernel_size;
            float sum = GSummedAreaTable[x_max][y_max] - 
                        GSummedAreaTable[x_max][y_min] -
                        GSummedAreaTable[x_min][y_max] +
                        GSummedAreaTable[x_min][y_min];
            float average = sum / max(x_kernel_size * y_kernel_size, 1);
            GBlurredImage.pixels[y_max*GBlurredImage.width + x_max] = color(average);
        }
    }
    GBlurredImage.updatePixels();
    image(GBlurredImage, 0, 0);
}


