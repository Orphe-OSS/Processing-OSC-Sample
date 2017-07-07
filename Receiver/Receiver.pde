/* You need to import oscP5 library.*/
import oscP5.*;

OscP5 oscP5;

static int LEFT = 0;
static int RIGHT = 1;
sensorVisualizer[] sv = new sensorVisualizer[2];

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,1234);
  
  for(int i = 0; i < 2; i++){
    sv[i] = new sensorVisualizer(20 + i*width/2, 0);
  }
}
 
void draw() {
  background(0);
  
  for(int i = 0;  i < 2; i++){
    sv[i].display();
  }
  
}

void oscEvent(OscMessage theOscMessage) {
  String address = theOscMessage.addrPattern();
  int side = LEFT;
  if(address.matches(".*/LEFT.*")){
    side = LEFT;
  }
  else if(address.matches(".*/RIGHT.*")){
    side = RIGHT;
  }
  else{
    print("received wrong message: " + address);
    return;
  }
  
  if(address.matches(".*/sensorValues.*")){
    sv[side].setOscMessage(theOscMessage);
  }
  else if(address.matches(".*/gesture.*")){
    String[] sidestr = {"LEFT", "RIGHT"};
    print("received gesture"+sidestr[side]+": ");
    print("kind:"+theOscMessage.get(0).stringValue()+",");
    print("angle:"+theOscMessage.get(1).stringValue()+",");
    println("power:"+theOscMessage.get(2).floatValue());
  }
  else{
    print("received other message: " + address);
  }
}