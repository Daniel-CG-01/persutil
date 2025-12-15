package net.ausiasmarch.persutil.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ExceptionBean {
    
    private Integer status;
    private String message;
    private Long timestamp;
}
