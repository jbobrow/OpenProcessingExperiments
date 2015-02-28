
class Boid 
{
	Matrix	matWorld;		// matrix representing the boids location/orientation
	PVector	vPos;		    // location
	PVector	vDir;	    	// cur direction
	PVector	vSeparationForce;
	PVector	vAlignmentForce;
	PVector	vCohesionForce;
	PVector	vMigratoryForce;
	PVector	vObstacleForce;
	int     iNumNeighbors;

	PVector	vDeltaPos;	// change in position from flock centering
	PVector	vDeltaDir;	// change in direction
	int		iDeltaCnt;	// number of boids that influence this delta_dir
	float	speed;
	float	yaw, pitch, roll, dyaw;
	PVector	vColor;
}


