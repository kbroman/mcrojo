## PRINT
setMethod(f="show", signature ="gss",definition = function(object){

	cat("The minimum is:\n")
	print(object@min)
       
})

## PLOT
setMethod(f="plot", signature = "gss",  definition = function(x, y, ...){
  
	g<-as.function(x@g)
	sequence<-seq(x@int.lower,x@int.upper,length.out=1000)
	plot(sequence,g(sequence), ylab=expression(g(x)), xlab=expression(x), type="l",...)
	points(x@min,g(x@min), lwd=2, col="red", pch=18)

})
          
## SUMMARY
setMethod(f="summary", signature = "gss",  definition = function(object){

	x<-object
	TAB <- matrix(c(x@min,x@int.lower,x@int.upper,x@it),ncol=1)
	colnames(TAB)="Value"
	rownames(TAB)<-c("Minimum of the function:","Initial interval (lower):","Initial interval (upper):","Iterations until convergency:") 
	print(TAB)
  
})
