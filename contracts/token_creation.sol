// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract token_creation is ERC721 {
    uint256 private tokenId;

    constructor() ERC721("MyBimbaToken", "MBTK") {
        tokenId = 0;
    }

    function mint(address _to, string memory _tokenURI) public {
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _tokenURI);
        tokenId++;
    }

    mapping(uint256 => string) private _tokenURIs;

    function _setTokenURI(
        uint256 _tokenId,
        string memory _tokenURI
    ) internal virtual {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI set of nonexistent token"
        ); // Checks if the tokenId exists
        _tokenURIs[_tokenId] = _tokenURI;
    }

    function tokenURI(
        uint256 _tokenId
    ) public view virtual override returns (string memory) {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI set of nonexistent token"
        );
        return _tokenURIs[_tokenId];
    }
}
