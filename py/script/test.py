import numpy as np
import cv2

on = cv2.imread('on.jpg',1)
off = cv2.imread('off.jpg',1)
aceso = 0
while(1):
	if(aceso):
		cv2.imshow('image',on)
	else:
		cv2.imshow('image',off)
	aceso = not aceso
	k = cv2.waitKey(0)
	cv2.destroyAllWindows()


