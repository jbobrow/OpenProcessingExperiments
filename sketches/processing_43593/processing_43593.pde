
    /*PImage bgImage;
    PImage newImage;
    Vehicle vehicles[];
    */

    int X_SIZE = 760;
    int Y_SIZE = 839;
    PImage bgImage;
    PImage newImage;
    int NUM_VEHICLES = 10000;
    int VEHICLE_WIDTH = 2;
    int VEHICLE_LENGTH = 4;
    int VEHICLE_COLOR = 0xffeeeeee;
    float SPEED_MULT = 2.0F;
    //Vehicle vehicles[];
    Vehicle[] vehicles = new Vehicle[10000];
    boolean LEAVE_TRAILS = true;
    int TRAIL_COLOR = 0xff111111;
    float CHANGE_PER_TRAIL = 0.01F;
    int FRAME_RATE = 60;

    void setup()
    {
        size(760, 839);
        background(255);
        bgImage = loadImage("Backimage.JPG");//new image load, craggy gardens
        newImage = loadImage("blank.jpg");
        makeVehicles();
        frameRate(1000);
    }

    void draw()
    {
        drawImage();
        calculateNextVehicleStates();
        updateVehicleStates();
    }


   void makeVehicles()
    {   
        for(int i = 0; i < 10000; i++)
            vehicles[i] = new Vehicle(0);

    }

    void calculateNextVehicleStates()
    {
        for(int i = 0; i < 10000; i++)
            vehicles[i].calculateNextState();

    }

    void updateVehicleStates()
    {
        for(int i = 0; i < 10000; i++)
            vehicles[i].updateState();

    }

    void drawImage()
    {
        loadPixels();
        System.arraycopy(newImage.pixels, 0, pixels, 0, 637640);
        updatePixels();
    }

    void drawVehicles()
    {
        for(int i = 0; i < 10000; i++)
            vehicles[i].drawV();

    }


class Vehicle {

        float x;
        float y;
        float direction;
        float nextX;
        float nextY;
        float nextDirection;
        float lSensorX;
        float lSensorY;
        float rSensorX;
        float rSensorY;
        float lSensorVal;
        float rSensorVal;
        float Vwidth;
        float Vlength;
        int type;
        int trailColor;
        int vehicleColor;
        boolean onEdge;
      
        Vehicle(int i)
        {
            trailColor = 0xff122111;
            //changed to a pale green
            vehicleColor = 0xffeeeeee;
            type = i;
            x = random(0.0F, 760F);
            y = random(0.0F, 839F);
            onEdge = false;
            direction = random(0.0F, 90F);
            Vwidth = 2.0F;
            Vlength = 100;
            //increased from 4. this adds the 100 pixel border on the sides and abstracts the image
        }
      
        void updateState()
        {
            x = nextX;
            y = nextY;
            direction = nextDirection;
            updateSensorPositions();
            float f = -(Vwidth / 2.0F) * sin(1.570796F - direction);
            float f1 = (Vwidth / 2.0F) * cos(1.570796F - direction);
            int i = parseInt(x - f);
            int j = parseInt(y + f1);
            int k = j * 760 + i;
            if(k < 0 || k >= 637640)
            {
                return;
            } else
            {
                int l = newImage.pixels[k];
                int i1 = parseInt((red(trailColor) - red(l)) * 0.01F);
                int j1 = parseInt((green(trailColor) - green(l)) * 0.01F);
                int k1 = parseInt((blue(trailColor) - blue(l)) * 0.01F);
                newImage.pixels[k] = color(red(l) + (float)i1, green(l) + (float)j1, blue(l) + (float)k1);
                return;
            }
        }

       void updateSensorPositions()
        {
            float f = -Vlength * sin(direction);
            float f1 = Vlength * cos(direction);
            float f2 = -Vwidth * sin(1.570796F - direction);
            float f3 = Vwidth * cos(1.570796F - direction);
            rSensorX = x + f;
            rSensorY = y + f1;
            lSensorX = rSensorX - f2;
            lSensorY = rSensorY + f3;
        }

        void readSensors()
        {
            if(lSensorY < 0.0F || lSensorY > 839F || lSensorX < 0.0F || lSensorX > 760F)
            {
                lSensorVal = 0.0F;
                onEdge = true;
            } else
            {
                lSensorVal = (2.0F * brightness(bgImage.get((int)lSensorX, (int)lSensorY))) / 255F;
            }
            if(rSensorY < 0.0F || rSensorY > 839F || rSensorX < 0.0F || rSensorX > 760F)
            {
                rSensorVal = 0.0F;
                onEdge = true;
            } else
            {
                rSensorVal = (2.0F * brightness(bgImage.get((int)rSensorX, (int)rSensorY))) / 255F;
            }
        }

        void calculateNextState()
        {
            readSensors();
            if(onEdge)
            {
                nextX = random(760F);
                nextY = random(839F);
                nextDirection = random(6.283185F);
                onEdge = false;
                return;
            }
            float f = lSensorVal;
            float f1 = rSensorVal;
            float f2 = atan2(f1 - f, Vwidth);
            float f3 = (f1 + f) / 2.0F;
            float f4 = cos(direction + f2 / 2.0F) * f3;
            float f5 = - sin(direction + f2 / 2.0F) * f3;
            nextX = x + f5;
            nextY = y + f4;
            nextDirection = direction + f2;
            if(nextDirection > 6.283185F)
                nextDirection -= 6.283185F;
        }

       void drawV()
        {
            int i = parseInt(x);
            int j = parseInt(y);
            stroke(20);
            fill(vehicleColor);
            pushMatrix();
            translate(i, j);
            rotate(direction);
            rect(0.0F, 0.0F, Vwidth, Vlength);
            popMatrix();
            noStroke();
            ellipseMode(3);
            fill(0.0F, 0.0F, 220F);
            ellipse(lSensorX, lSensorY, 3, 3);
            ellipse(rSensorX, rSensorY, 3, 3);
        }
}


