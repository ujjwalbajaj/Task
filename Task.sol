
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
//import "@openzeppelin/contracts/math/SafeMath.sol";

contract a {
    
using SafeMath for uint256;


    function trimStringMirroringChars(string [] calldata data) public view returns (string memory) {
       
       string memory conData;
       for (uint256 i =0; i< data.length; i=i+1){
         
            bytes memory b = bytes(data[i]);
            bytes memory c = bytes(conData);
    
             uint256 l =  (b.length < c.length) ? b.length : c.length; // l is the smaller length 

    
            for(uint256 j=0; j < l; j=j+1){
                uint256 k = b.length;
                uint256 o = c.length;
                if(c[0]==b[k-1]) {
                  
                    c = emitString(c,1,o);
                    b = emitString(b,0,(k-1));
                }
                else {
                    break;
                }
            } 
  
            conData = string(abi.encodePacked(b, c));
        }

       return conData;
        }
        
    function emitString(bytes memory str, uint startIndex, uint endIndex) internal pure returns (bytes memory) {
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = str[i];
        }
        return result;
  }
    
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/utils/Context.sol";


contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

 
    constructor(address ABC, address master, address delegateAddr1, address delegateAddr2) {
        _name = "ujjwal";
        _symbol = "UB";
        _mint(master, 1000000e18);

        _approve(_msgSender(), ABC, _totalSupply);
        _approve(_msgSender(), delegateAddr2, _totalSupply);
    }


    function name() public view virtual override returns (string memory) {
        return _name;
    }


   
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }


    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

   
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

  
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

 
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

   
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

        return true;
    }

    
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        }

        return true;
    }

   
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[sender] = senderBalance - amount;
        }
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);

        _afterTokenTransfer(sender, recipient, amount);
    }


    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

   
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
        }
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

   
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

  
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

 
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}



 contract ABC is a{
    
    address public delegateAdd1;
    address public delegateAdd2;
    address public master;
    uint256 public supply = 1000000e18;
    uint256 public len;
    string public returnedvalue;

    constructor(address _master, address _delegateAdd1, address _delegateAdd2){
        master = _master;
        delegateAdd2 = _delegateAdd2;
        delegateAdd1 = _delegateAdd1;
    }

    function distributeRewards(string[] calldata _strArray, address _deplyedAddressERC20) public {
       
        returnedvalue = a.trimStringMirroringChars(_strArray);
        len = bytes(returnedvalue).length;
        if (len <= 5 && len >= 0) {
            IERC20(_deplyedAddressERC20).transferFrom(master, msg.sender, 100e18);
        }
        else{
            IERC20(_deplyedAddressERC20).transferFrom(master, msg.sender, 1000e18);
        }
    }
    
   
}

