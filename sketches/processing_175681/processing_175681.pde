
float ellipseWidth;
    float ellipseHeight;
    float ellipseAngle;
    float ellipseWidthAngle;
    float ellipseHeightAngle;
    float cellipseHeightAngle;
    float einc, widthAngleInc, heightAngleInc;
    float hnoise, wnoise;
    float hNoiseInc, wNoiseInc, zNoiseInc, chNoiseInc, cEllipseNoiseInc;

    float midX, midY;
    float frame = 0;
    float zAngle = 0;
    float zNoise;
    float chnoise;
    float chEllipseFillColorAngle;
    float chEllipseFillColor;

    
    void drawOscilatingEllipse(float p_width, float p_height, int p_index){
        colorMode(HSB, 255);

        pushMatrix();
        translate(midX, midY);
        rotate(zAngle);

        float widthRadius = ellipseWidth - (cos(ellipseWidthAngle) * p_width / 2);
        float heightRadius = ellipseHeight - (sin(ellipseHeightAngle) * p_height / 2);

        noFill();
        strokeWeight(3);
        stroke(100, 20);
        //ellipse(0, 0, widthRadius, heightRadius);


        fill(chEllipseFillColor, 200, 60, 4);
        stroke(40f, 150f, 200f, 80f / (0.9f * (p_index + 1)));
        //strokeWeight(2);
        ellipse(0, 0, widthRadius, heightRadius);

        rotate(zAngle + 3 * PI);
        fill(chEllipseFillColor + 128 , 200, 40, 4);
        stroke(40f, 150f, 200f, 70f / (0.9f * (p_index + 1)));
        ellipse(0, 0, widthRadius, heightRadius);

        popMatrix();
    }


    public void setup() {
        size(640,640);
        ellipseWidth = 200;
        ellipseHeight = 200;
        ellipseAngle = 0;
        ellipseWidthAngle = 0;
        ellipseHeightAngle = 0;
        cellipseHeightAngle = 0;
        chEllipseFillColorAngle = 0;
        chEllipseFillColor = random(0, 255);
        einc = 0.01f;
        widthAngleInc = 0.001f;
        heightAngleInc = 0.001f;
        cEllipseNoiseInc = 0.001f;
        wnoise = random(200);
        hnoise = random(200);
        zNoise = random(200);
        chnoise = random(200);

        wNoiseInc = 0.0001f;
        hNoiseInc = 0.0001f;
        zNoiseInc = 0.001f;
        chNoiseInc = 0.001f;

        midX = width/2;
        midY = height/2;
    }

    public void draw() {


        //background(0, 80);
        fill(0, 10);
        rect(0, 0, width, height);
        ellipseAngle += einc;
        //ellipseWidthAngle += widthAngleInc;
        //ellipseHeightAngle += heightAngleInc;

        float wn = noise(wnoise);
        ellipseWidthAngle += map(wn, 0, 1, -0.002f, -0.001f);
        wnoise += wNoiseInc;

        float hn = noise(hnoise);
        ellipseHeightAngle += map(hn, 0, 1, -0.002f, -0.001f);
        hnoise += hNoiseInc;

        float zn = noise(zNoise);
        zAngle += map(zn, 0, 1, -0.01f, 0.01f);
        zNoise += zNoiseInc;

        float chn = noise(chnoise);
        chnoise += chNoiseInc;
        chEllipseFillColorAngle += map(chn, 0, 1, -0.01f, 0.01f);
        chEllipseFillColor = abs(cos(chEllipseFillColorAngle) * 255);


        //drawReferenceEllipse();
        //drawReferencePoint();

        float minRadius = height/8;
        float maxRadius = height * 4;
        drawOscilatingEllipses(10, minRadius + 100, maxRadius + 100);
        //drawOscilatingEllipseReferencePoint();


    }

    void drawOscilatingEllipses(float p_numEllipses, float p_minRadius, float p_maxRadius)
    {
        float radiusIncrement = (p_maxRadius - p_minRadius) / p_numEllipses;
        for(int i = 0; i < p_numEllipses; i++)
        {
            drawOscilatingEllipse(p_minRadius + radiusIncrement * i, p_minRadius + radiusIncrement * i, i);
        }
    }



    
