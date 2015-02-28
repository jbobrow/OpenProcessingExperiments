
var Time = 0;

var cord = function(lng, tension)
{
    this.Length = lng;
    this.mesh = [];
    this.meshpoints = 10;
    this.tension = tension || 10;
    var self = this;
   
   
    this.createMesh = function(nMeshValues)
    {
        if (nMeshValues)
        {
            self.meshpoints = nMeshValues;
        }
        
        for (var i = 0; i <= self.meshpoints; i++)
        {
            self.mesh.push([i* self.Length/self.meshpoints, 0]);
        }
        
    }
    
    this.setup = function(nMeshValues)
    {
        self.createMesh(nMeshValues);
    }
    
    this.draw = function()
    {
        fill(40, 40, 255);
        smooth();
        noStroke();
        ellipse(100, 200, 20, 20);
        ellipse(100 + self.Length, 200, 20, 20);
        stroke(0, 0, 0);
        strokeWeight(2);
        for (var i = 0; i < self.meshpoints; i++)
        {
            line(100 + self.mesh[i][0], 
                 200 + self.mesh[i][1] , 
                 100 + self.mesh[i+1][0], 
                 200 + self.mesh[i+1][1]);
        }
        
    }
}

function wave1(crd)
{
    
    for (var i = 0; i < crd.meshpoints; i++)
    {
        var u = 0;
        for (var n = 0; n < 10; n++)
        {
            u += (pow(-1,n) * pow((2*n + 1), -2) * sin( degrees((2*n + 1) * PI * crd.mesh[i][0])) * cos( degrees((2*n + 1) * PI * crd.tension * Time)));
            
        }
        
        u *= 4/ (5 * PI * PI);
        crd.mesh[i][1] = 1000 * u;   
    }
}



var Cord = null;
void setup()
{
    size(640, 400);
    //noLoop();
    Cord = new cord(440, 2);
    Cord.setup(50);
}

void draw()
{
    background(255);
    Cord.draw();
    wave1(Cord);
    Time += 0.0002;
}
