/* You need to import oscP5 library.*/
import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress myRemoteLocation;
 
void setup(){
  size(500, 500);
  colorMode(HSB, 360, 255, 255);
  oscP5 = new OscP5(this,1234);
  myRemoteLocation = new NetAddress("127.0.0.1", 4321);//host,port
}
 
void draw(){
  for(int i = 0; i < width; i++){
    stroke(i*360.0f/(float)width,255,255);
    line(i,0,i,height);
  }
}
 
void mousePressed(){
  OscMessage myMessage = new OscMessage("/BOTH/triggerLightWithRGBColor");
  color c = get(mouseX, mouseY);
  myMessage.add(int(mouseY/(height/10))); //light number
  myMessage.add(red(c));
  myMessage.add(green(c));
  myMessage.add(blue(c));
  oscP5.send(myMessage, myRemoteLocation); 
}