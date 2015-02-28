
//Gloriana Gonzalez
//HW 12 Visual Animation of Data  
//gloriang@andrew.cmu.edu
//Copyright Gloriana Gonzalez, Pittsburgh, October 2012

//This code represents a set of earthquake data/
//The latitude and longitude of the earthquakes was used to position the the data on the page
//The magnitude was represented using the diameter of the ellipses
//The depth of the earthquakes was respresented using the transparency of the fill

//Press 1, 2 or 3 to highlight earthquakes of magnitudes divided into three categories.
//3 highlights the strongest earthquakes, 2 the middle sized earthquakes, and 1 the smallest earthquakes

float m1, m2, x, y, d;
color col1;

int [] depth={46, 54,9,66,320,29,92,66,365,10,33,159,18,41,10,17,156,5,30,30,9,156,10,73,
              5,10,10,45,17,513,159,205,10,36,10,26,79,13,38,21,22,0,1,1,10,16,10,7,0,
              14,41,3,9,36,30,35,112,10,51,35,98,561,13,10,10,41,92,10,20,32,546,15,10,
              43,5,10,33,15,10,48,35,30,39,35,5,0,153,5,337,13,12,35,53,62,136,68,110,
              5,55,67,168,175,198,13,260,96,168,59,65,44,27,32,103,5,10,106,53,41,39,545,
              77,69,20,45,6,7,12,61,22,166,10,67,83,3,10,10,60,62,54,50,34,35,22,102,10,
              10,87,35,115,10,16,6,37,50,15,20,37,29,17,50,21,44,1,36,14,53,21,203,1,12,
              51,43,35,10,10,8,35,35,35,35,108,492,60,60,145,12,25,10,513,10,10,10,13,26,
              602,21,43,10,82,29,119,13,164,19,27,1,30, 29};  //represent with transparency

int date []; //use to determine order of appearance

int time []; //use to determine order of appearance

float magnitude1 [];

float magnitude []={5.2, 4.6,4.4,4.8,4.6,4.8,5,5.5,4.3,4.7,4.5,4.6,4.3,4.3,5.1,4.7,4.4,2.8,
                    4.6,4.7,5.3,4.6,4.7,4.3,5.4,5,4.8,6.1,4.7,4.3,4.4,4.6,4.5,4.9,4.8,4.5,
                    4.9,4.4,3.1,4.5,4.4,5.9,2.6,2.6,4.6,4.5,4.4,3.8,3.3,4.3,4.9,2.6,2.5,4.3,
                    4.1,5.3,4.5,4.8,4.5,4.4,4.7,4.5,5.2,4.2,4.3,4.7,4.8,4.9,4.9,3.3,4.5,4.5,
                    4.6,4.2,3.6,4.6,5.1,5,5.9,4.6,5,5.5,4.7,5.2,2.9,2.8,4.8,3.2,6,4.7,2.7,
                    4.5,4.7,4.4,4.2,4.4,5.6,4.1,2.9,2.6,4.3,4.2,4.8,2.8,4.9,4.5,5.3,4.7,5.6,
                    4.9,4.5,4.5,5.3,4.4,4.9,5,5,4.8,5,5.2,5.5,4.5,4.3,5.3,3,2.8,2.9,4.4,5.6,
                    4.9,4.7,4.6,4.8,3.9,4.3,4.6,5,5.1,5.1,4.5,5.6,5.1,4.8,5.5,5.3,4.4,4.4,
                    5.7,4.1,2.5,4.9,2.5,5.8,4.8,4.5,4.9,4.2,5.3,4.2,5.1,2.7,4.4,4.4,3.4,2.8,
                    3.3,4.6,4.5,5.1,2.6,5.1,3,4.9,4.8,4.1,2.5,4.4,4.4,4.1,4,4.6,4.5,5,4.7,
                    4.7,4.9,5.2,4.3,4.4,4.4,4.6,4.7,6.6,4.6,4.6,5.1,4.2,4.2,5.5,5.3,2.8,
                    4.4,4.9,4.8,4.8,4.7,2.6,4.3}; //represent with size and some kind of resonance
                    
float latitude []={-56.339, 38.02,58.213,39.083,4.22,-16.509,12.655,12.683,-5.441,27.753,
                    24.956,-7.346,19.521,10.128,53.434,-37.618,38.183,35.631,52.172,13.783,
                    36.311,21.072,43.701,-7.989,66.315,66.387,-5.253,-13.555,49.876,-17.503,
                    6.761,-21.517,37.471,-3.546,2.672,7.379,24.447,10.897,61.093,30.117,-32.251,
                    44.105,19.408,19.408,-31.773,29.191,29.411,36.468,19.415,-21.09,32.708,
                    19.387,66.193,-4.935,-7.48,-30.698,-10.261,-9.471,39.309,12.295,-38.745,
                    -19.333,32.556,32.176,30.16,39.594,-4.745,-62.802,-0.121,60.721,-20.598,
                    -6.505,39.32,-34.689,42.221,53.391,-8.098,23.855,-54.273,48.329,1.301,
                    -19.011,-1.124,-14.977,35.748,45.275,-4.885,35.678,4.191,18.707,32.483,
                    12.428,-13.512,14.155,-6.405,36.59,-38.825,43.583,19.064,18.149,36.759,
                    16.164,-5.422,39.353,39.749,16.216,31.221,48.228,49.569,32.946,37.459,
                    38.268,31.289,37.273,-36.812,35.926,51.856,36.761,-31.819,-20.331,14.15,
                    -3.235,-10.843,-13.157,44.389,44.392,44.39,19.203,51.912,-38.392,25.211,
                    12.747,55.648,40.624,40.712,-1.202,48.406,-10.264,36.167,42.734,38.215,
                    48.345,-35.305,14.768,41.832,41.741,60.105,48.298,36.107,33.489,-2.538,
                    38.099,-7.141,4.527,-34.606,-2.799,-4.644,-2.537,-32.711,-16.886,47.723,
                    25.361,16.584,19.721,62.01,62.02,41.761,36.687,-19.908,19.498,-11.101,
                    18.801,-22.237,37.56,21.009,34.971,1.767,16.878,1.837,24.548,-23.627,
                    27.685,9.625,3.013,14.425,10.511,35.764,1.619,28.337,1.529,-4.868,-4.939,
                    -4.893,34.108,-19.563,-56.316,-34.011,7.705,-32.867,1.488,18.063,24.767,
                    4.549,-34.023,-10.016,-34.077,17.856,-15.523}; //y values
                    
float longitude []={-25.749,141.889,-155.296,142.305,124.548,-174.745,-88.147,-88.106,128.202,
                    59.395,56.139,128.594,-69.824,-85.525,142.634,-73.44,74.13,-97.214,176.579,
                    96.225,-120.856,122.075,88.259,108.276,-18.674,-18.581,68.659,166.563,88.489,
                    -178.969,-73.063,-66.691,69.174,100.573,-79.752,91.82,122.525,-74.139,-150.397,
                    131.001,-72.141,-121.339,-155.28,-155.28,-71.999,52.523,51.269,-121.034,-155.279,
                    176.436,141.664,-155.244,-147.903,134.106,-80.2,-177.645,161.249,67.066,141.966,
                    -88.407,176.051,-177.558,30.95,-115.21,102.817,143.255,152.177,155.95,125.563,
                    -149.408,-178.36,98.031,-29.875,-71.906,-101.96,-35.141,123.597,81.294,143.919,
                    154.451,97.229,-174.162,126.87,-173.602,-113.088,-112.764,151.624,-97.115,124.573,
                    -70.873,-96.96,-88.853,-70.351,-91.187,129.93,140.213,176.083,-70.713,-66.397,-68.491,
                    71.26,-61.964,147.14,-118.1,15.55,-94.023,130.192,154.538,156.526,141.354,35.689,
                    46.96,140.288,37.083,78.67,69.687,159.494,141.698,-72.167,-178.26,-91,136.997,113.701,
                    165.525,-111.053,-111.079,-111.04,-69.044,159.445, 175.9,101.967,-88.783,161.75,-125.314,
                    74.099,26.778,154.443,161.409,69.24,142.451,144.333,154.429,-73.924,-92.233,46.406,46.306,
                    -152.543,154.446,70.35,-109.242,142.329,-116.689,156.046,125.116,-72.209,100.091,153.137,
                    142.326,-176.018,-174.479,-122.62,-113.249,-98.076,-64.171,-147.771,-150.248,46.347,71.116,
                    -173.936,-155.8,162.835,-65.573,170.481,95.729,145.148,-84.353,127.26,-100.187,97.035,94.017,
                    -67.805,139.757,-84.247,126.799,120.622,-62.814,140.346,-90.716,138.671, -90.732,133.817,
                    133.916,134.027,73.698,-64.064,-25.71,-72.483,-38.511,-70.401,92.526,-68.53,-110.162,125.667,
                    -72.223,160.837,-72.268,-64.91,-75.074}; //x values


void setup ()
{
size (926,702);
smooth();
magnitude1= new float[magnitude.length];
col1=color(0,0,0);
  
}


void draw()
{
background(255);
fill( 0 );  


frameRate(3);

for ( int i = 0; i < longitude.length; i++) 
  {
   float m1 = map(magnitude[i], min(magnitude), max(magnitude), 5, 50);
   
   float x = map(longitude[i], -min(longitude), -max(longitude), 50 ,width-50-m1 );
   
   float y=  map(latitude[i], min(latitude), max(latitude), 50, height-50-m1);
   
   float d = map(depth[i], min(depth), max(depth), 30, 255); // this maps the values of the depth
                                                           //from 0 to 255 so this can be used 
                                                           //to determine the transparency depending
 
                                                        
  fill(col1, d);
  noStroke();
  ellipseMode(CENTER);
  ellipse( x, y, m1, m1);
  
  if(keyPressed)
  {
     if ( key == '1')
    {
      float m2 = map(magnitude[i], min(magnitude), max(magnitude), 0, 3);
    
      if (m2<=1)
      {
      fill ( 0, 0, 255, d*2);
      ellipse ( x, y, m1, m1);
      } 
    }
    if (key=='2')
    {
      float m2 = map(magnitude[i], min(magnitude), max(magnitude), 1, 3);
    
      if (m2<=2 && m2>1)
      {
      fill ( 0, 255, 255, d*2);
      ellipse ( x, y, m1, m1);
      } 
      
    }
    if (key=='3')
    {
      float m2 = map(magnitude[i], min(magnitude), max(magnitude), 1, 3);
    
      if (m2<=3 && m2>2)
      {
      fill ( 255, 0, 0, d*2);
      ellipse ( x, y, m1, m1);
      } 
      
    }
  }
  
  }


}




