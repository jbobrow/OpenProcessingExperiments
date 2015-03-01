
// Variables x, y, z are set in the web page via javascript and jquery.
// Every time the sensor updates, it updates the x, y, z positions.
// If there is no sensor, then x, y, z are null.

// Add a link to jQuery and this code to the html page:

/*
    <script type="text/javascript">
      var x; var y; var z;
      window.ondevicemotion = function(event) {
        x = event.accelerationIncludingGravity.x;  
        y = event.accelerationIncludingGravity.y;  
        z = event.accelerationIncludingGravity.z; 
      };
    </script>
*/


void setup()
{
  size(400,300);
  stroke(0);
  fill(0);
  textSize(30);
}

void draw()
{
  // Grey background
  background(#aaaaaa);

  // Determine whether x was set in the javascript
  if(x == null)
  {
    textSize(20);
    text("No accelerometer detected\nAre you on a mobile phone?", 20, 60);
  }
  else text("sensor detected", 20, 60);

  // Display sensor data
  text("x: " + x, 20, 120);
  text("y: " + y, 20, 180);
  text("z: " + z, 20, 240);
}


