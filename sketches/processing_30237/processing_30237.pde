
/* Spherical to Cartesian Coordinate Conversion (=S23C ;)  
 * the Cartesian coordinates are calculated from the spherical coordinates 
 * (r, θ, φ ), where r ∈ [0, ∞ ), θ ∈ [0, π ], φ ∈ [0, 2π )
 */

class SPoint { // makes xyz from spherical point given 
  float x=0.0, y=0.0, z=0.0; 
  // r radius, incl 
  SPoint( float r, float incl, float azim) { 
    this.x = r * sin( radians( incl)) * cos( radians( azim)); 
    this.z = r * sin( radians( incl)) * sin( radians( azim)); 
    this.y = r * cos( radians( incl)) ;
  } // end Constructor
}

// Quote: The use of (r, θ, φ) to denote, respectively, 
// radial distance, inclination (or elevation), and azimuth, 
// is common practice in physics, and is specified by ISO standard 33-11.


