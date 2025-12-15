package net.ausiasmarch.persutil.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import net.ausiasmarch.persutil.bean.ExceptionBean;

@ControllerAdvice
public class ApplicationExceptionHandler {
    
    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<ExceptionBean> handleRuntimeException(RuntimeException ex) {
        ExceptionBean oExceptionBean = new ExceptionBean(500, ex.getMessage(), System.currentTimeMillis());
        return new ResponseEntity<>(oExceptionBean, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ExceptionBean> handleResourceNotFoundException(RuntimeException ex) {
        ExceptionBean oExceptionBean = new ExceptionBean(500, ex.getMessage(), System.currentTimeMillis());
        return new ResponseEntity<>(oExceptionBean, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(UnauthorizedException.class)
    public ResponseEntity<ExceptionBean> handleUnauthorizedException(RuntimeException ex) {
        ExceptionBean oExceptionBean = new ExceptionBean(500, ex.getMessage(), System.currentTimeMillis());
        return new ResponseEntity<>(oExceptionBean, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(ResourceNotModifiedException.class)
    public ResponseEntity<ExceptionBean> handleResourceNotModifiedException(RuntimeException ex) {
        ExceptionBean oExceptionBean = new ExceptionBean(500, ex.getMessage(), System.currentTimeMillis());
        return new ResponseEntity<>(oExceptionBean, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
