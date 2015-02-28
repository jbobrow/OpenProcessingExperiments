
public class MySkeleton {
  // Properties
  private SeletonNode[]   _skeletonHistory;
  private float           _sumMovement;

  private float           MAX_CONFIDENCE = 0.95;
  private float           MIN_SLOWMOVE = 150;
  private float           MAX_SLOWMOVE = 300; 

  MySkeleton() {
    _skeletonHistory = new SeletonNode[2];
    for (int i=0; i<2; i++) {
      _skeletonHistory[i] = new SeletonNode();
    }
  }

  public void addNode(SimpleOpenNI _SONIContext, int _userId) {
    float                 _confidence = 0;
    PVector               _tempNode = new PVector(0, 0, 0);
    PVector               _projNode = new PVector(0, 0, 0);
    _sumMovement = 0;

    //CopyArray 1 to 0
    _skeletonHistory[0].setNodeHead(_skeletonHistory[1].getNodeHead());
    _skeletonHistory[0].setNodeNeck(_skeletonHistory[1].getNodeNeck());
    _skeletonHistory[0].setNodeLeftShoulder(_skeletonHistory[1].getNodeLeftShoulder());
    _skeletonHistory[0].setNodeLeftElbow(_skeletonHistory[1].getNodeLeftElbow());
    _skeletonHistory[0].setNodeLeftHand(_skeletonHistory[1].getNodeLeftHand());
    _skeletonHistory[0].setNodeRightShoulder(_skeletonHistory[1].getNodeRightShoulder());
    _skeletonHistory[0].setNodeRightElbow(_skeletonHistory[1].getNodeRightElbow());
    _skeletonHistory[0].setNodeRightHand(_skeletonHistory[1].getNodeRightHand());
    _skeletonHistory[0].setNodeTorso(_skeletonHistory[1].getNodeTorso());
    _skeletonHistory[0].setNodeLeftHip(_skeletonHistory[1].getNodeLeftHip());
    _skeletonHistory[0].setNodeLeftKnee(_skeletonHistory[1].getNodeLeftKnee());
    _skeletonHistory[0].setNodeLeftFoot(_skeletonHistory[1].getNodeLeftFoot());
    _skeletonHistory[0].setNodeRightHip(_skeletonHistory[1].getNodeRightHip());
    _skeletonHistory[0].setNodeRightKnee(_skeletonHistory[1].getNodeRightKnee());
    _skeletonHistory[0].setNodeRightFoot(_skeletonHistory[1].getNodeRightFoot());

    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_HEAD, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeHead(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_NECK, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeNeck(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeLeftShoulder(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_LEFT_ELBOW, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeLeftElbow(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_LEFT_HAND, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeLeftHand(_projNode);
    }
    //println("hand: " + _projNode.x + "," + _projNode.y + "," + _projNode.z);
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeRightShoulder(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeRightElbow(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_RIGHT_HAND, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeRightShoulder(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_TORSO, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeTorso(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_LEFT_HIP, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeLeftHip(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_LEFT_KNEE, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeLeftKnee(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_LEFT_FOOT, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeLeftFoot(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_RIGHT_HIP, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeRightHip(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_RIGHT_KNEE, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeRightKnee(_projNode);
    }
    _confidence = _SONIContext.getJointPositionSkeleton(_userId, SimpleOpenNI.SKEL_RIGHT_FOOT, _tempNode);
    if (_confidence > MAX_CONFIDENCE) {
      _SONIContext.convertRealWorldToProjective(_tempNode, _projNode);
      _skeletonHistory[1].setNodeLeftFoot(_projNode);
    }

    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeHead(), _skeletonHistory[1].getNodeHead()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeNeck(), _skeletonHistory[1].getNodeNeck()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeLeftShoulder(), _skeletonHistory[1].getNodeLeftShoulder()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeLeftElbow(), _skeletonHistory[1].getNodeLeftElbow()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeLeftHand(), _skeletonHistory[1].getNodeLeftHand()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeRightShoulder(), _skeletonHistory[1].getNodeRightShoulder()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeRightElbow(), _skeletonHistory[1].getNodeRightElbow()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeRightHand(), _skeletonHistory[1].getNodeRightHand()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeTorso(), _skeletonHistory[1].getNodeTorso()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeLeftHip(), _skeletonHistory[1].getNodeLeftHip()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeLeftKnee(), _skeletonHistory[1].getNodeLeftKnee()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeLeftFoot(), _skeletonHistory[1].getNodeLeftFoot()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeRightHip(), _skeletonHistory[1].getNodeRightHip()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeRightKnee(), _skeletonHistory[1].getNodeRightKnee()));
    _sumMovement += abs(PVector.dist(_skeletonHistory[0].getNodeRightFoot(), _skeletonHistory[1].getNodeRightFoot()));
  }

  public int getSpeed() {
    //println(_sumMovement);

    if (_sumMovement < MIN_SLOWMOVE) {
      return 0;
    } 
    else if (_sumMovement < MAX_SLOWMOVE) {
      return 1;
    } 
    else {
      return 2;
    }
  }
  
  public int torsoLocate() {
    return round(_skeletonHistory[1].getNodeTorso().x);
  }
}


